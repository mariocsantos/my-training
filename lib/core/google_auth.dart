import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> login() async {
    try {
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();

      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
      
      FirebaseUser user = authResult.user;
      print("signed in " + user.displayName);
      
      return user;
    } catch (error) {
      print('Google login error: ' + error);
    }
  }
}
