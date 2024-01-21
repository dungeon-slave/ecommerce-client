import 'package:core/core.dart' show Hive, Box;
import 'package:core/enums/role.dart';
import 'package:core_ui/core_ui.dart' show AppNumConstants;
import 'package:data/entities/cart_item/cart_item_entity.dart';
import 'package:data/entities/dish_type/dish_type_entity.dart';
import 'package:data/entities/user/user_entity.dart';

class HiveProvider {
  late final Box<bool> _themeBox;
  late final Box<CartItemEntity> _cartBox;
  late final Box<DishTypeEntity> _menuBox;
  late final Box<double> _textScaleBox;
  late final Box<UserEntity> _userBox;
  //late final Box<String> _userIdBox;
  //late final Box<Roles> _userRoleBox;

  Future<void> openBoxes() async {
    _themeBox = await Hive.openBox<bool>(_HiveKeys.themeBox);
    _cartBox = await Hive.openBox<CartItemEntity>(_HiveKeys.cartBox);
    _menuBox = await Hive.openBox(_HiveKeys.menuBox);
    _textScaleBox = await Hive.openBox(_HiveKeys.textScaleBox);
    _userBox = await Hive.openBox(_HiveKeys.userBox);
    // _userIdBox = await Hive.openBox(_HiveKeys.userIdBox);
    // _userRoleBox = await Hive.openBox(_HiveKeys.userRoleBox);
  }

  Future<void> saveMenu(List<DishTypeEntity> dishesTypes) async {
    await _menuBox.clear();
    for (int i = 0; i < dishesTypes.length; i++) {
      await _menuBox.put(i, dishesTypes[i]);
    }
  }

  List<DishTypeEntity> fetchMenu() => _menuBox.values.toList();

  Future<void> saveTheme(bool isDark) =>
      _themeBox.put(_HiveKeys.themeKey, isDark);

  bool fetchTheme() => _themeBox.get(_HiveKeys.themeKey) ?? true;

  Future<void> saveTextScale(double textScale) =>
      _textScaleBox.put(_HiveKeys.textScaleKey, textScale);

  double fetchTextScale() =>
      _textScaleBox.get(_HiveKeys.textScaleKey) ?? AppNumConstants.minScale;

  Future<void> changeItemCount(CartItemEntity item) async {
    for (CartItemEntity element in _cartBox.values) {
      if (element.dishEntity.id == item.dishEntity.id) {
        if (item.count == 0) {
          return await _cartBox.delete(element.dishEntity.id);
        }
        return await _cartBox.put(
          element.dishEntity.id,
          CartItemEntity(
            dishEntity: element.dishEntity,
            count: item.count,
          ),
        );
      }
    }
  }

  List<CartItemEntity> fetchCartItems() => _cartBox.values.toList();

  int fetchCartItemsCount() {
    int count = 0;
    for (CartItemEntity element in _cartBox.values) {
      count += element.count;
    }

    return count;
  }

  Future<void> saveCartItem(CartItemEntity item) {
    for (CartItemEntity element in _cartBox.values) {
      if (element.dishEntity.id == item.dishEntity.id) {
        return _cartBox.put(
          element.dishEntity.id,
          CartItemEntity(
            dishEntity: element.dishEntity,
            count: element.count + 1,
          ),
        );
      }
    }
    return _cartBox.put(item.dishEntity.id, item);
  }

  Future<void> clearCart() => _cartBox.clear();

  Future<void> saveUser(UserEntity entity) =>
      _userBox.put(_HiveKeys.userKey, entity);

  String fetchUserId() => _userBox.get(_HiveKeys.userKey)?.id ?? '';

  Role fetchUserRole() =>
      _userBox.get(_HiveKeys.userKey)?.role ?? Role.undefined;

  Future<void> removeUser() => _userBox.clear();
}

class _HiveKeys {
  static const String themeBox = 'appTheme';
  static const String cartBox = 'appCart';
  static const String menuBox = 'appMenu';
  static const String textScaleBox = 'appTextScale';
  static const String userBox = 'appUser';
  //static const String userIdBox = 'appUserId';
  //static const String userRoleBox = 'appUserRole';

  static const String themeKey = 'theme';
  static const String textScaleKey = 'textScale';
  static const String userKey = 'user';
  //static const String userIdKey = 'userId';
  //static const String userRoleKey = 'userRole';
}
