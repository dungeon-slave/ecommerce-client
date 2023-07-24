import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/dish_type_model.dart';
import 'package:domain/usecase/usecase.dart';

part 'dishes_menu_event.dart';
part 'dishes_menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FetchDishesUsecase _fetchDishesUsecase;

  MenuBloc(this._fetchDishesUsecase)
      : super(MenuState(
          items: <DishTypeModel>[],
          isLoading: true,
        )) {
    on<InitEvent>(_init);
    on<ChangeTypeEvent>(_changeType);

    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<MenuState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final List<DishTypeModel> types = await _fetchDishesUsecase.execute(const NoParams());
      emit(
        state.copyWith(
          isLoading: false,
          items: types,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _changeType(ChangeTypeEvent event, Emitter<MenuState> emit) {
    emit(state.copyWith(currentTab: event.typeIndex));
  }
}
