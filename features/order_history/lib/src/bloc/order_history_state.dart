part of 'order_history_bloc.dart';

class OrderHistoryState {
  final bool isLoading;
  final String errorMessage;
  final List<OrderModel> items;

  const OrderHistoryState({
    this.isLoading = false,
    this.errorMessage = '',
    required this.items,
  });

  OrderHistoryState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<OrderModel>? items,
  }) {
    return OrderHistoryState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }
}
