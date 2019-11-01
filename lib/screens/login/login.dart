import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_form.dart';

import '../../components/custom_icons.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signInWithGoogle() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final AuthResult  authResult = await _firebaseAuth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    print("signed in " + user.displayName);
    return user;
  }

  Widget build(BuildContext context) {
    double paddingSide = 24;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    left: paddingSide,
                    right: paddingSide,
                    top: 36,
                    bottom: 36,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Logo
                      Container(
                        child: Text(
                          'MY TRAINING',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                bottom: 24,
                                top: 24,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Login',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    child: Text(
                                      'Escreva seu e-mail e senha para recuperar seus treinos.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            LoginForm(),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Ou treine usando uma rede social.',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 24),
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      onPressed: () async {
                                        try {
                                          await _signInWithGoogle();
                                        } catch(error) {
                                          
                                        }
                                      },
                                      child: Icon(CustomIcons.google),
                                      heroTag: 'loginGoogle',
                                    ),
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: Colors.blue[700],
                                    foregroundColor: Colors.white,
                                    onPressed: () {},
                                    child: Icon(CustomIcons.facebook),
                                    heroTag: 'loginFacebook',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: paddingSide, right: paddingSide),
                height: 44,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                    .withOpacity(0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Não tem uma conta?',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'CRIE UMA',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
