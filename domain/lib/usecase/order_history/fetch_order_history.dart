import 'package:domain/models/order_history/order_model.dart';
import 'package:domain/repositories/order_history_repository.dart';
import 'package:domain/usecase/usecase.dart';

class FetchOrderHistoryUseCase
    implements AsyncUseCase<NoParams, List<OrderModel>> {
  final OrderHistoryRepository _orderHistoryRepository;

  const FetchOrderHistoryUseCase({
    required OrderHistoryRepository orderHistoryRepository,
  }) : _orderHistoryRepository = orderHistoryRepository;

  @override
  Future<List<OrderModel>> execute(NoParams input) async {
    return await _orderHistoryRepository.fetchOrderHistory();
  }
}
