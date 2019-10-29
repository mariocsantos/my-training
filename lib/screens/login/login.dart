import 'package:flutter/material.dart';

import 'login_form.dart';

import '../../components/custom_icons.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    double paddingSide = 24;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: paddingSide, right: paddingSide),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Logo
                    Container(
                      padding: EdgeInsets.only(top: 48, bottom: 48),
                      child: Text(
                        'MY TRAINING',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 24),
                      ),
                    ),
                    // Login info
                    Container(
                      margin: EdgeInsets.only(bottom: 24),
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
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 42, bottom: 42),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Ou treine usando uma rede social.',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 24),
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.red,
                                    onPressed: () {},
                                    child: Icon(CustomIcons.google),
                                  ),
                                ),
                                FloatingActionButton(
                                  backgroundColor: Colors.blue[700],
                                  onPressed: () {},
                                  child: Icon(CustomIcons.facebook),
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
              Container(
                padding: EdgeInsets.only(left: paddingSide, right: paddingSide),
                height: 44,
                color: Colors.grey[800],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Não tem uma conta?',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'CRIE UMA',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
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
