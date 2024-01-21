import 'package:core/core.dart' show FirebaseFirestore, QueryDocumentSnapshot;
import 'package:core/enums/role.dart';
import 'package:core_ui/core_ui.dart' show AppStrConstants;
import 'package:data/entities/dish_type/dish_type_entity.dart';
import 'package:data/entities/order_history/order_entity.dart';
import 'package:data/entities/user/user_entity.dart';

class FirebaseProvider {
  Future<List<DishTypeEntity>> fetchMenu() async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> dishTypes =
        (await FirebaseFirestore.instance
                .collection(AppStrConstants.menuCollection)
                .get())
            .docs;

    return dishTypes
        .map(
          (QueryDocumentSnapshot<Map<String, dynamic>> dishType) =>
              DishTypeEntity.fromJson(dishType.data()),
        )
        .toList();
  }

  Future<List<OrderEntity>> fetchOrderHistory(String uid) async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> orders =
        (await FirebaseFirestore.instance
                .collection(AppStrConstants.usersCollection)
                .doc(uid)
                .collection(AppStrConstants.userOrdersCollection)
                .get())
            .docs;

    return orders
        .map(
          (QueryDocumentSnapshot<Map<String, dynamic>> order) =>
              OrderEntity.fromJson(order.data()),
        )
        .toList();
  }

  Future<Role> fetchRole(String uid) async {
    final String roleName = (await FirebaseFirestore.instance
            .collection(AppStrConstants.usersCollection)
            .doc(uid)
            .get())
        .data()?[AppStrConstants.userRoleField];

    return Role.values.byName(roleName);
  }

  Future<void> createUser(UserEntity entity) {
    return FirebaseFirestore.instance
        .collection(AppStrConstants.usersCollection)
        .doc(entity.id)
        .set(entity.toJson());
  }

  Future<void> sendOrder(OrderEntity order, String uid) {
    return FirebaseFirestore.instance
        .collection(AppStrConstants.usersCollection)
        .doc(uid)
        .collection(AppStrConstants.userOrdersCollection)
        .doc(order.id)
        .set(order.toJson());
  }
}
