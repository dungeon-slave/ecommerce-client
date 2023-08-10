import 'package:domain/models/authentication/email_sign_in_model.dart';
import 'package:domain/models/authentication/email_sign_up_model.dart';

abstract class AuthenticationRepository {
  Future<String> emailSignUp({
    required EmailSignUpModel data,
  });
  Future<String> emailSignIn({
    required EmailSignInModel data,
  });
  Future<String> googleSignIn();
  Future<void> signOut();
  Future<void> saveUser(String userId);
  bool checkUser();
}
