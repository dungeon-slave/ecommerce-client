import 'package:domain/domain.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:domain/usecase/usecase.dart';

class SendOrderUseCase implements AsyncUseCase<OrderModel, void> {
  final CartRepository _cartRepository;

  const SendOrderUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(OrderModel input) async =>
      await _cartRepository.sendOrder(input);
}
