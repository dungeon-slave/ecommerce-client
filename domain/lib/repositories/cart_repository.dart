import 'package:domain/models/cart_items/cart_item_model.dart';

abstract class CartRepository {
  Future<void> saveItem(CartItemModel item);
  Future<void> changeItemCount(CartItemModel item);
  List<CartItemModel> getItems();
  int getItemsCount();
  Future<void> clearCart();
}
