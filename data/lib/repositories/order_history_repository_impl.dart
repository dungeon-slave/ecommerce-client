import 'package:core/services/network_service.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/entities/order_history_entity/order_entity.dart';
import 'package:data/mappers/order_mapper.dart';
import 'package:data/providers/local/hive_provider.dart';
import 'package:data/providers/remote/firebase_provider.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:domain/repositories/order_history_repository.dart';

class OrderHistoryRepositoryImpl implements OrderHistoryRepository {
  final FirebaseProvider _firebaseProvider;
  final HiveProvider _hiveProvider;
  final NetworkService _networkService;

  const OrderHistoryRepositoryImpl({
    required FirebaseProvider firebaseProvider,
    required HiveProvider hiveProvider,
    required NetworkService networkService,
  })  : _firebaseProvider = firebaseProvider,
        _hiveProvider = hiveProvider,
        _networkService = networkService;

  @override
  Future<List<OrderModel>> fetchOrderHistory() async {
    final bool isConnected = await _networkService.checkConnection();
    if (isConnected) {
      String userId = _hiveProvider.fetchUserId();
      List<OrderEntity> result =
          await _firebaseProvider.fetchOrderHistory(userId);
      return result.map((OrderEntity e) => OrderMapper.toModel(e)).toList();
    } else {
      throw Exception(AppConstants.connectionLoss);
    }
  }
}
