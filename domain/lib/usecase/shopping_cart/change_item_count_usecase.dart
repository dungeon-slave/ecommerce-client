import 'package:domain/models/cart_items/cart_item_model.dart';
import 'package:domain/repositories/cart_repository.dart';
import 'package:domain/usecase/usecase.dart';

class ChangeItemCountUseCase implements AsyncUseCase<CartItemModel, void> {
  final CartRepository _cartRepository;

  const ChangeItemCountUseCase({required CartRepository cartRepository})
      : _cartRepository = cartRepository;

  @override
  Future<void> execute(CartItemModel input) =>
      _cartRepository.changeItemCount(input);
}
