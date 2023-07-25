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
        super(
          const HomeScreenState(
            count: 0,
            isConnected: false,
            isVisibleMessage: false,
          ),
        ) {
    on<ChangeCartCountEvent>(_changeCartCount);
    on<ChangeConnectionEvent>(_changeConnectionStatus);
    on<ShowMessageEvent>(_changeMessageVisibility);
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
      state.copyWith(
        count: _getCartCountUseCase.execute(const NoParams()),
      ),
    );
  }

  void _changeMessageVisibility(
      ShowMessageEvent event, Emitter<HomeScreenState> emit) {
    emit(
      state.copyWith(
        isVisibleMessage: false,
      ),
    );
  }

  void _changeConnectionStatus(
      ChangeConnectionEvent event, Emitter<HomeScreenState> emit) {
    emit(state.copyWith(
      isConnected: event.isConnected,
      isVisibleMessage: true,
    ));
    Future.delayed(const Duration(seconds: 3), () {
      add(ShowMessageEvent(isVisible: false));
    });
  }
}
