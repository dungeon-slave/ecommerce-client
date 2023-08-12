import 'package:core/services/network_service.dart';
import 'package:core_ui/core_ui.dart' show AppConstants;
import 'package:data/entities/cart_item_entity/cart_item_entity.dart';
import 'package:data/mappers/cart_item_mapper.dart';
import 'package:data/mappers/order_mapper.dart';
import 'package:data/providers/local/hive_provider.dart';
import 'package:data/providers/remote/firebase_provider.dart';
import 'package:domain/models/cart_items/cart_item_model.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final HiveProvider _hiveProvider;
  final FirebaseProvider _firebaseProvider;
  final NetworkService _networkService;

  const CartRepositoryImpl({
    required HiveProvider hiveProvider,
    required FirebaseProvider firebaseProvider,
    required NetworkService networkService,
  })  : _hiveProvider = hiveProvider,
        _firebaseProvider = firebaseProvider,
        _networkService = networkService;

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
  Future<void> saveItem(CartItemModel item) =>
      _hiveProvider.saveCartItem(CartItemMapper.toEntity(item));

  @override
  Future<void> clearCart() => _hiveProvider.clearCart();

  @override
  int fetchItemsCount() => _hiveProvider.fetchCartItemsCount();

  @override
  Future<void> changeItemCount(CartItemModel item) =>
      _hiveProvider.changeItemCount(CartItemMapper.toEntity(item));

  @override
  Future<void> sendOrder(OrderModel item) async {
    await _networkService.checkConnection()
        ? await _firebaseProvider.sendOrder(
            OrderMapper.toEntity(item),
            _hiveProvider.fetchUserId(),
          )
        : throw Exception(AppConstants.connectionLoss);
  }
}
