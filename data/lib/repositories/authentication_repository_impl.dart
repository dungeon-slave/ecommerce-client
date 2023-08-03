import 'package:data/providers/local/hive_provider.dart';
import 'package:data/providers/remote/firebase_auth_provider.dart';
import 'package:domain/models/authentication/email_sign_in_model.dart';
import 'package:domain/models/authentication/email_sign_up_model.dart';
import 'package:domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuthProvider _authProvider;
  final HiveProvider _hiveProvider;

  const AuthenticationRepositoryImpl({
    required FirebaseAuthProvider authProvider,
    required HiveProvider hiveProvider,
  })  : _authProvider = authProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<String> emailSignIn({required EmailSignInModel data}) async =>
      await _authProvider.emailSignIn(data: data);

  @override
  Future<String> emailSignUp({required EmailSignUpModel data}) async =>
      await _authProvider.emailSignUp(data: data);

  @override
  Future<String> googleSignIn() async => await _authProvider.googleSignIn();

  @override
  Future<void> signOut() async {
    await _authProvider.signOut();
    await _hiveProvider.removeUser();
  }

  @override
  Future<void> saveUser(String userId) async =>
      await _hiveProvider.saveUserId(userId);

  @override
  bool checkUser() => _hiveProvider.getUserId() != null ? true : false;
}
