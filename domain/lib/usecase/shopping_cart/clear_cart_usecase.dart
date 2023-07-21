import 'package:domain/repositories/cart_repository.dart';
import 'package:domain/usecase/usecase.dart';

class ClearCartUseCase implements AsyncUseCase<NoParams, void> {
  final CartRepository _cartRepository;

  ClearCartUseCase({required CartRepository cartRepository})
      : _cartRepository = cartRepository;

  @override
  Future<void> execute(NoParams input) => _cartRepository.clearCart();
}
