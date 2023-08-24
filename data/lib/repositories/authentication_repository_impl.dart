import 'package:data/providers/remote/firebase_auth_provider.dart';
import 'package:domain/models/authentication/email_sign_in_model.dart';
import 'package:domain/models/authentication/email_sign_up_model.dart';
import 'package:domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuthProvider _authProvider;

  const AuthenticationRepositoryImpl({
    required FirebaseAuthProvider authProvider,
  }) : _authProvider = authProvider;

  @override
  Future<String> emailSignIn(EmailSignInModel data) =>
      _authProvider.emailSignIn(data: data);

  @override
  Future<String> emailSignUp(EmailSignUpModel data) =>
      _authProvider.emailSignUp(data: data);

  @override
  Future<String> googleSignIn() => _authProvider.googleSignIn();

  @override
  Future<void> signOut() => _authProvider.signOut();
}
