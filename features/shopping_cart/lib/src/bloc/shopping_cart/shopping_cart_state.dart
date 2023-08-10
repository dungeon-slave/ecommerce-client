part of 'shopping_cart_bloc.dart';

class ShoppingCartState {
  final bool isLoading;
  final String errorMessage;
  final List<CartItemModel> items;

  const ShoppingCartState({
    this.isLoading = false,
    this.errorMessage = '',
    required this.items,
  });

  double totalPrice() {
    double total = 0;
    for (CartItemModel item in items) {
      total += item.averagePrice;
    }

    return total;
  }

  ShoppingCartState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CartItemModel>? items,
  }) {
    return ShoppingCartState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }
}
