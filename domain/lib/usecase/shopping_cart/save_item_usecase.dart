import 'package:domain/models/cart_items/cart_item_model.dart';
import 'package:domain/repositories/cart_repository.dart';
import 'package:domain/usecase/usecase.dart';

class SaveItemUseCase implements AsyncUseCase<CartItemModel, void> {
  final CartRepository _cartRepository;

  SaveItemUseCase({required CartRepository cartRepository})
      : _cartRepository = cartRepository;

  @override
  Future<void> execute(CartItemModel input) {
    return _cartRepository.saveItem(input);
  }
}
