import 'package:core/core.dart';
import 'package:domain/domain.dart';

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
    return (await _firebaseAuth.createUserWithEmailAndPassword(
      email: data.email,
      password: data.password,
    ))
        .user!
        .uid; //TODO remove ! operator
  }

  Future<String> emailSignIn({
    required EmailSignInModel data,
  }) async {
    User? user = (await _firebaseAuth.signInWithEmailAndPassword(
      email: data.email,
      password: data.password,
    ))
        .user;
    return user != null ? user.uid : '';
    // return (await _firebaseAuth.signInWithEmailAndPassword(
    //   email: data.email,
    //   password: data.password,
    // ))
    //     .user!
    //     .uid; //TODO remove ! operator
  }

  Future<String> googleSignIn() async {
    //TODO refactor
    final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleAccount?.authentication;
    if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
      //create new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return (await _firebaseAuth.signInWithCredential(credential)).user!.uid;
    }
    return '';
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}
