import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/usecase/home_screen/get_cart_count_usecase.dart';
import 'package:domain/usecase/usecase.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final GetCartCountUseCase _getCartCountUseCase;

  HomeScreenBloc(GetCartCountUseCase getCartCountUseCase)
      : _getCartCountUseCase = getCartCountUseCase,
        super(HomeScreenState(
          count: 0,
          isConnected: true,
        )) {
    on<ChangeCartCountEvent>(_changeCartCount);
    on<ChangeConnectionEvent>(_changeConnectionStatus);
    InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus event) {
        add(
          ChangeConnectionEvent(
            isConnected: event == InternetConnectionStatus.connected,
          ),
        );
      },
    );
  }

  void _changeCartCount(
      ChangeCartCountEvent event, Emitter<HomeScreenState> emit) {
    emit(
      HomeScreenState(
          count: _getCartCountUseCase.execute(const NoParams()),
          isConnected: state.isConnected),
    );
  }

  void _changeConnectionStatus(
      ChangeConnectionEvent event, Emitter<HomeScreenState> emit) {
    emit(HomeScreenState(
      count: state.count,
      isConnected: event.isConnected,
    ));
  }
}
