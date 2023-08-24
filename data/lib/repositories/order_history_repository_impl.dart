import 'package:core/safe_request.dart';
import 'package:data/entities/order_history_entity/order_entity.dart';
import 'package:data/mappers/order_mapper.dart';
import 'package:data/providers/local/hive_provider.dart';
import 'package:data/providers/remote/firebase_provider.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:domain/repositories/order_history_repository.dart';

class OrderHistoryRepositoryImpl implements OrderHistoryRepository {
  final FirebaseProvider _firebaseProvider;
  final HiveProvider _hiveProvider;

  const OrderHistoryRepositoryImpl({
    required FirebaseProvider firebaseProvider,
    required HiveProvider hiveProvider,
  })  : _firebaseProvider = firebaseProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<List<OrderModel>> fetchOrderHistory() async {
    final List<OrderEntity> result = await safeRequest<List<OrderEntity>>(
      () => _firebaseProvider.fetchOrderHistory(
        _hiveProvider.fetchUserId(),
      ),
    );

    return result.map((OrderEntity e) => OrderMapper.toModel(e)).toList();
  }
}
