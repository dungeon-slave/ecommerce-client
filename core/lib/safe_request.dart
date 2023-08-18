import 'package:core/di/app_di.dart';
import 'package:core/services/network_service.dart';
import 'package:core_ui/core_ui.dart' show AppStrConstants;

Future<T> safeRequest<T>(Future<T> Function() request) async {
  if (await appLocator<NetworkService>().checkConnection()) {
    return request();
  } else {
    throw Exception(AppStrConstants.connectionLoss);
  }
}
