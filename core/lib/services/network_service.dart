import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkService {
  final InternetConnectionChecker _internetConnectionChecker;
  final Connectivity _connectivity;

  const NetworkService({
    required InternetConnectionChecker internetConnectionChecker,
    required Connectivity connectivity,
  })  : _internetConnectionChecker = internetConnectionChecker,
        _connectivity = connectivity;

  void addListener(void Function() callBack) {
    _connectivity.onConnectivityChanged.listen(
      (_) => callBack(),
    );
  }

  Future<bool> checkConnection() {
    return _internetConnectionChecker.hasConnection;
  }
}
