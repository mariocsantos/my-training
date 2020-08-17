import 'package:firebase_auth/firebase_auth.dart';

import 'facebook_auth.dart';
import 'google_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  final FacebookAuth _facebookAuth;
  final GoogleAuth _googleAuth;

  AuthRepository(
      {FirebaseAuth firebaseAuth,
      FacebookAuth facebookAuth,
      GoogleAuth googleAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _facebookAuth = facebookAuth ?? new FacebookAuth(),
        _googleAuth = googleAuth ?? new GoogleAuth();

  Future<FirebaseUser> signInWithFacebook() async {
    return _facebookAuth.signIn();
  }

  Future<FirebaseUser> signInWithGoogle() async {
    return _googleAuth.signIn();
  }

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _facebookAuth.signOut(),
      _googleAuth.signOut(),
    ]);
  }

   Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<FirebaseUser> getUser() async {
    return await _firebaseAuth.currentUser();
  }
}
