import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/dish_model.dart';

part 'event.dart';
part 'state.dart';

class MenuBloc extends Bloc<IMenuEvent, IMenuState> {
  final FetchDishesUsecase _fetchDishesUsecase;
  List<DishModel>? _cachedModels;

  MenuBloc(this._fetchDishesUsecase) : super(EmptyState()) {
    on<ChangeTypeEvent>(_changeType);
  }

  void _changeType(ChangeTypeEvent event, Emitter<IMenuState> emit) async {
    emit(LoadingState());
    try {
      _cachedModels ??= await _fetchDishesUsecase.execute();
      emit(MenuState(dishes: _cachedModels!.where((e) => e.type == event.type).toList()));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
