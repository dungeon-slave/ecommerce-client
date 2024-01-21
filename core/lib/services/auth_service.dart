import 'package:core/enums/role.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;

class AuthService extends ChangeNotifier {
  Role _role = Role.undefined;

  Role get role => _role;

  set role(Role value) {
    _role = value;
    notifyListeners();
  }
}
