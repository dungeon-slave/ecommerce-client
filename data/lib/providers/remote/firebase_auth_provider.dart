import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart' show EmailSignInModel, EmailSignUpModel;

class FirebaseAuthProvider {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  const FirebaseAuthProvider({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  Future<String> emailSignUp({
    required EmailSignUpModel data,
  }) async {
    final User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
      email: data.email,
      password: data.password,
    ))
        .user;
    if (user == null) {
      throw (Exception(AppConstants.authException));
    }
    return user.uid;
  }

  Future<String> emailSignIn({
    required EmailSignInModel data,
  }) async {
    final User? user = (await _firebaseAuth.signInWithEmailAndPassword(
      email: data.email,
      password: data.password,
    ))
        .user;
    if (user == null) {
      throw (Exception(AppConstants.authException));
    }
    return user.uid;
  }

  Future<String> googleSignIn() async {
    final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleAccount?.authentication;
    User? user;
    if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      user = (await _firebaseAuth.signInWithCredential(credential)).user;
    }
    if (user == null) {
      throw (Exception(AppConstants.authException));
    }
    return user.uid;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}
