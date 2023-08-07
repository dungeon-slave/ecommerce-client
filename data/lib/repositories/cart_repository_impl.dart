import 'package:data/entities/cart_item_entity/cart_item_entity.dart';
import 'package:data/mappers/cart_item_mapper.dart';
import 'package:data/providers/local/hive_provider.dart';
import 'package:domain/models/cart_items/cart_item_model.dart';
import 'package:domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final HiveProvider _hiveProvider;

  const CartRepositoryImpl({required HiveProvider hiveProvider})
      : _hiveProvider = hiveProvider;

  @override
  List<CartItemModel> fetchItems() {
    final List<CartItemEntity> result = _hiveProvider.fetchCartItems();

    return result
        .map(
          (CartItemEntity e) => CartItemMapper.toModel(e),
        )
        .toList();
  }

  @override
  Future<void> saveItem(CartItemModel item) => _hiveProvider.saveCartItem(
        CartItemMapper.toEntity(item),
      );

  @override
  Future<void> clearCart() => _hiveProvider.clearCart();

  @override
  int fetchItemsCount() => _hiveProvider.fetchCartItemsCount();

  @override
  Future<void> changeItemCount(CartItemModel item) =>
      _hiveProvider.changeItemCount(
        CartItemMapper.toEntity(item),
      );
}
