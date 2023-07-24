import 'package:core/core.dart';
import 'package:data/entities/cart_item_entity/cart_item_entity.dart';

class HiveProvider {
  late final Box<bool> _themeBox;
  late final Box<CartItemEntity> _cartBox;

  Future<void> openBoxes() async {
    _themeBox = await Hive.openBox<bool>(_HiveKeys.themeBox);
    _cartBox = await Hive.openBox<CartItemEntity>(_HiveKeys.cartBox);
  }

  Future<void> saveTheme(bool isDark) async =>
      await _themeBox.put(_HiveKeys.themeKey, isDark);

  Future<void> changeItemCount(CartItemEntity item) async {
    for (CartItemEntity element in _cartBox.values) {
      if (element.dishEntity.id == item.dishEntity.id) {
        if (item.count == 0) {
          await _cartBox.delete(element.dishEntity.id);
          break;
        }
        await _cartBox.put(
          element.dishEntity.id,
          CartItemEntity(
            dishEntity: element.dishEntity,
            count: item.count,
          ),
        );
        break;
      }
    }
  }

  Future<void> saveCartItem(CartItemEntity item) async {
    for (CartItemEntity element in _cartBox.values) {
      if (element.dishEntity.id == item.dishEntity.id) {
        await _cartBox.put(
          element.dishEntity.id,
          CartItemEntity(
            dishEntity: element.dishEntity,
            count: element.count + 1,
          ),
        );
        return;
      }
    }
    await _cartBox.put(item.dishEntity.id, item);
  }

  Future<void> clearCart() async => await _cartBox.clear();

  bool getTheme() => _themeBox.get(_HiveKeys.themeKey) ?? true;

  int getCartItemsCount() {
    int count = 0;
    for (CartItemEntity element in _cartBox.values) {
      count += element.count;
    }

    return count;
  }

  List<CartItemEntity> getCartItems() => _cartBox.values.toList();
}

class _HiveKeys {
  static const String themeBox = 'appTheme';
  static const String cartBox = 'appCart';

  static const String themeKey = 'theme';
}
