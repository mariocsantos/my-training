import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> singInWithFacebook() async {
    final FacebookLogin _facebookLogin = new FacebookLogin();
    final result = await _facebookLogin.logInWithReadPermissions(['email', 'public_profile']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: result.accessToken.token);
        final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
        FirebaseUser user = authResult.user;
        print("signed in " + user.displayName + '; ' + user.photoUrl);

        break;
      case FacebookLoginStatus.cancelledByUser:
        print("Facebook login cancelled");
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
  }
}
