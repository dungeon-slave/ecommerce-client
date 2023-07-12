import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/dish_model.dart';
import 'package:domain/models/dish_type_model.dart';

part 'dishes_menu_event.dart';
part 'dishes_menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FetchDishesUsecase _fetchDishesUsecase;
  late final List<DishTypeModel> types; //??

  MenuBloc(this._fetchDishesUsecase) : super(LoadingState()) {
    on<InitEvent>(_init);
    on<ChangeTypeEvent>(_changeType);

    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<MenuState> emit) async {
    emit(LoadingState());
    try {
      types = await _fetchDishesUsecase.execute();
      emit(TabsListState(tabsNames: types.map((e) => e.typeName).toList()));
    } catch (e) {
      emit(
        ErrorState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _changeType(ChangeTypeEvent event, Emitter<MenuState> emit) {
    try {
      emit(
        DishesListState(
          dishes: types[event.typeIndex].dishesModels,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
