import 'package:domain/models/order_history/order_model.dart';

abstract class OrderHistoryRepository {
  Future<List<OrderModel>> fetchOrderHistory();
}
