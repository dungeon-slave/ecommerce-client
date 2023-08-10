import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/entities/cart_item_entity/cart_item_entity.dart';
import 'package:data/entities/dish_type_enity/dish_type_entity.dart';

class HiveProvider {
  late final Box<bool> _themeBox;
  late final Box<CartItemEntity> _cartBox;
  late final Box<DishTypeEntity> _menuBox;
  late final Box<double> _textScaleBox;

  Future<void> openBoxes() async {
    _themeBox = await Hive.openBox<bool>(_HiveKeys.themeBox);
    _cartBox = await Hive.openBox<CartItemEntity>(_HiveKeys.cartBox);
    _menuBox = await Hive.openBox(_HiveKeys.menuBox);
    _textScaleBox = await Hive.openBox(_HiveKeys.textScaleBox);
  }

  Future<void> saveMenu(List<DishTypeEntity> dishesTypes) async {
    await _menuBox.clear();
    for (int i = 0; i < dishesTypes.length; i++) {
      await _menuBox.put(i, dishesTypes[i]);
    }
  }

  Future<void> saveTheme(bool isDark) async =>
      await _themeBox.put(_HiveKeys.themeKey, isDark);

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

  Future<void> saveTextScale(double textScale) async => await _textScaleBox.put(_HiveKeys.textScaleKey, textScale);

  bool getTheme() => _themeBox.get(_HiveKeys.themeKey) ?? true;

  double getTextScale() => _textScaleBox.get(_HiveKeys.textScaleKey) ?? AppConstants.textScales[1];

  int getCartItemsCount() {
    int count = 0;
    for (CartItemEntity element in _cartBox.values) {
      count += element.count;
    }

    return count;
  }

  List<DishTypeEntity> getMenu() => _menuBox.values.toList();

  List<CartItemEntity> getCartItems() => _cartBox.values.toList();

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

  Future<void> clearCart() async => await _cartBox.clear();
}

class _HiveKeys {
  static const String themeBox = 'appTheme';
  static const String cartBox = 'appCart';
  static const String menuBox = 'appMenu';
  static const String textScaleBox = 'appTextScale';

  static const String themeKey = 'theme';
  static const String textScaleKey = 'textScale';
}
