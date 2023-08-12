import 'package:core/core.dart' show FirebaseFirestore, QueryDocumentSnapshot;
import 'package:core_ui/core_ui.dart' show AppConstants;
import 'package:data/entities/dish_type_enity/dish_type_entity.dart';
import 'package:data/entities/order_history_entity/order_entity.dart';

class FirebaseProvider {
  Future<List<DishTypeEntity>> fetchMenu() async =>
      (await FirebaseFirestore.instance
              .collection(AppConstants.menuCollection)
              .get())
          .docs
          .map(
            (QueryDocumentSnapshot<Map<String, dynamic>> dishType) =>
                DishTypeEntity.fromJson(dishType.data()),
          )
          .toList();

  Future<List<OrderEntity>> fetchOrderHistory(String uid) async =>
      (await FirebaseFirestore.instance
              .collection(AppConstants.usersCollection)
              .doc(uid)
              .collection(AppConstants.userOrdersCollection)
              .get())
          .docs
          .map(
            (QueryDocumentSnapshot<Map<String, dynamic>> order) =>
                OrderEntity.fromJson(order.data()),
          )
          .toList();

  Future<void> sendOrder(OrderEntity order, String uid) async =>
      await FirebaseFirestore.instance
          .collection(AppConstants.usersCollection)
          .doc(uid)
          .collection(AppConstants.userOrdersCollection)
          .doc(order.id)
          .set(order.toJson());
}
