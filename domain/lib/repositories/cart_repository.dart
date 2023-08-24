import 'package:domain/models/cart_items/cart_item_model.dart';
import 'package:domain/models/order_history/order_model.dart';

abstract class CartRepository {
  Future<void> sendOrder(OrderModel item);
  Future<void> saveItem(CartItemModel item);
  Future<void> changeItemCount(CartItemModel item);
  List<CartItemModel> fetchItems();
  int fetchItemsCount();
  Future<void> clearCart();
}
