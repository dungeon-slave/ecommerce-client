import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/dish_model.dart';

part 'main_menu_event.dart';
part 'main_menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FetchDishesUsecase _fetchDishesUsecase;
  final Map<String, List<DishModel>> dishesByType = {};

  MenuBloc(this._fetchDishesUsecase) : super(LoadingState()) {
    on<InitEvent>(_init);
    on<ChangeTypeEvent>(_changeType);
    on<GetDishesTypesEvent>(_getDishesTypes);
    on<GetDishesTypeEvent>(_getDishesType);

    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<MenuState> emit) async {
    try {
      List<DishModel> models = await _fetchDishesUsecase.execute();

      for (DishModel model in models) {
        if (dishesByType.containsKey(model.type)) {
          dishesByType[model.type]!.add(model);
        }
        else {
          dishesByType.addAll({model.type : [model]});
        }
      }
      add(GetDishesTypesEvent());
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  void _changeType(ChangeTypeEvent event, Emitter<MenuState> emit) {
    try {
      emit(DishesListState(dishes: dishesByType[event.type]!));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  void _getDishesTypes(GetDishesTypesEvent event, Emitter<MenuState> emit) {
    try {
      emit(TabsListState(tabsNames: dishesByType.keys.toList()));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  void _getDishesType(GetDishesTypeEvent event, Emitter<MenuState> emit) {
    try {
      emit(CurrentTabState(currentTabName: dishesByType.keys.elementAt(event.selectedIndex)));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
