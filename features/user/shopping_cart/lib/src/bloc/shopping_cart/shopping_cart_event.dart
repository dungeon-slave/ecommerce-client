part of 'shopping_cart_bloc.dart';

abstract class ShoppingCartEvent {}

class InitEvent extends ShoppingCartEvent {}

class IncrementEvent extends ShoppingCartEvent {
  final CartItemModel model;

  IncrementEvent({required this.model});
}

class DecrementEvent extends ShoppingCartEvent {
  final CartItemModel model;

  DecrementEvent({required this.model});
}

class ClearCartEvent extends ShoppingCartEvent {}

class CheckoutEvent extends ShoppingCartEvent {}
