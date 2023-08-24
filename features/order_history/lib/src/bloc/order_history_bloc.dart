import 'package:core/core.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:domain/usecase/order_history/fetch_order_history.dart';
import 'package:domain/usecase/usecase.dart';

part 'order_history_event.dart';
part 'order_history_state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final FetchOrderHistoryUseCase _fetchOrderHistoryUseCase;

  OrderHistoryBloc({
    required FetchOrderHistoryUseCase fetchOrderHistoryUseCase,
  })  : _fetchOrderHistoryUseCase = fetchOrderHistoryUseCase,
        super(
          const OrderHistoryState(
             items: <OrderModel>[],
          ),
        ) {
    on<InitEvent>(_init);

    add(InitEvent());
  }

  Future<void> _init(InitEvent event, Emitter<OrderHistoryState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    try {
      emit(
        state.copyWith(
          isLoading: false,
          items: await _fetchOrderHistoryUseCase.execute(const NoParams()),
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
}
