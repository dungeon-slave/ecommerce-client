import 'package:core_ui/core_ui.dart' show AppDimens;
import 'package:flutter/material.dart' show Icon, Icons;

final class AppIcons {
  //TODO make app icon
  static const Icon closeDetailedPage = Icon(
    Icons.clear,
    size: AppDimens.size40,
  );
  static const Icon unselectedMenu = Icon(
    Icons.storefront,
  );
  static const Icon selectedMenu = Icon(
    Icons.storefront_rounded,
  );
  static const Icon selectedOrderHistory = Icon(
    Icons.verified,
  );
  static const Icon unselectedOrderHistory = Icon(
    Icons.verified_outlined,
  );
  static const Icon selectedShoppingCart = Icon(
    Icons.shopping_cart,
  );
  static const Icon unselectedShoppingCart = Icon(
    Icons.shopping_cart_outlined,
  );
  static const Icon selectedSettings = Icon(
    Icons.settings,
  );
  static const Icon unselectedSettings = Icon(
    Icons.settings_outlined,
  );
  static const Icon clearCart = Icon(
    Icons.delete,
  );
}
