import 'package:domain/models/cart_items/cart_item_model.dart';
import 'package:domain/repositories/cart_repository.dart';
import 'package:domain/usecase/usecase.dart';

class GetItemsUseCase implements UseCase<NoParams, List<CartItemModel>> {
  final CartRepository _cartRepository;

  const GetItemsUseCase({required CartRepository cartRepository})
      : _cartRepository = cartRepository;

  @override
  execute(NoParams input) {
    return _cartRepository.getItems();
  }
}
