import 'package:flutter/material.dart';

abstract class AppIconsData {
  static const IconData unselectedAdminMenu = Icons.assignment_outlined;
  static const IconData selectedAdminMenu = Icons.assignment_rounded;

  static const IconData unselectedUsers = Icons.manage_accounts_outlined;
  static const IconData selectedUsers = Icons.manage_accounts;

  static const IconData unselectedMenu = Icons.storefront;
  static const IconData selectedMenu = Icons.storefront_rounded;

  static const IconData selectedOrderHistory = Icons.verified;
  static const IconData unselectedOrderHistory = Icons.verified_outlined;

  static const IconData selectedShoppingCart = Icons.shopping_cart;
  static const IconData unselectedShoppingCart = Icons.shopping_cart_outlined;

  static const IconData selectedSettings = Icons.settings;
  static const IconData unselectedSettings = Icons.settings_outlined;

  static const IconData clearCart = Icons.delete;
  static const IconData closeDetailedPage = Icons.clear;
}
