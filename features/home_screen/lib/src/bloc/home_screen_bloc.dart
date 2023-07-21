import 'package:bloc/bloc.dart';
import 'package:domain/usecase/home_screen/get_cart_count_usecase.dart';
import 'package:domain/usecase/usecase.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final GetCartCountUseCase _getCartCountUseCase;

  HomeScreenBloc(GetCartCountUseCase getCartCountUseCase)
      : _getCartCountUseCase = getCartCountUseCase,
        super(HomeScreenState(count: 0)) {
    on<ChangeCartCountEvent>(_changeCartCount);
  }

  void _changeCartCount(
      ChangeCartCountEvent event, Emitter<HomeScreenState> emit) {
    emit(
      HomeScreenState(count: _getCartCountUseCase.execute(const NoParams())),
    );
  }
}
