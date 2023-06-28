import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/dish_model.dart';

part 'event.dart';
part 'state.dart';

class MenuBloc extends Bloc<IMenuEvent, IMenuState> {
  final FetchDishesUsecase _fetchDishesUsecase;

  MenuBloc(this._fetchDishesUsecase) : super(EmptyState()) {
    on<ChangeTypeEvent>(_changeType);
  }

  void _changeType(ChangeTypeEvent event, Emitter<IMenuState> emit) async {
    emit(LoadingState());
    try {
      emit(MenuState(dishes: await _fetchDishesUsecase.execute(event.type)));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}