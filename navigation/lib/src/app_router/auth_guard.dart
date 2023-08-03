import 'package:core/services/auth_service.dart';
import 'package:navigation/navigation.dart';

class AuthGuard extends AutoRedirectGuard {
  final AuthService _authService;

  AuthGuard({
    required AuthService authService,
  }) : _authService = authService {
    _authService.addListener(() {
      if (!_authService.authenticated) {
        reevaluate();
      }
    });
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_authService.authenticated) {
      resolver.next();
    }
    else {
      router.replace(const SignRouter());
    }
  }

  @override
  Future<bool> canNavigate(RouteMatch route) {
    return Future(() => false);
  }
}
