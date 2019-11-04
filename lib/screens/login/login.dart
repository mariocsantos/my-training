import 'package:flutter/material.dart';

import '../../core/google_auth.dart';
import '../../core/facebook_auth.dart';
import '../../components/custom_icons.dart';
import '../../components/footer-link.dart';

import 'login_form.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final googleAuth = new GoogleAuth();
  final facebookAuth = new FacebookAuth();

  Widget getHeader() {
    return Container(
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
    );
  }

  Widget getLogo() {
    return Container(
      child: Text(
        'MY TRAINING',
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget getGoogleButton() {
    return Container(
      margin: EdgeInsets.only(right: 24),
      child: FloatingActionButton(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        onPressed: () async {
          await googleAuth.login();
        },
        child: Icon(CustomIcons.google),
        heroTag: 'loginGoogle',
      ),
    );
  }

  Widget getFacebookButton() {
    return FloatingActionButton(
      backgroundColor: Colors.blue[700],
      foregroundColor: Colors.white,
      onPressed: () async {
        try {
          await facebookAuth.singInWithFacebook();
          print('sucesso');
        } catch (error) {
          print(error);
        }
      },
      child: Icon(CustomIcons.facebook),
      heroTag: 'loginFacebook',
    );
  }

  Widget getSocialLogin() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Ou treine usando uma rede social.',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                getGoogleButton(),
                getFacebookButton(),
              ],
            ),
          )
        ],
      ),
    );
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
                      getLogo(),
                      Container(
                        child: Column(
                          children: <Widget>[
                            getHeader(),
                            LoginForm(),
                          ],
                        ),
                      ),
                      getSocialLogin(),
                    ],
                  ),
                ),
              ),
              FooterLink(
                text: 'Não tem uma conta?',
                actionName: 'Crie uma',
                actionRoute: '/singup',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
