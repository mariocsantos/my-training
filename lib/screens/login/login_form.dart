import 'package:flutter/material.dart';
import 'package:my_training/core/authentication.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _auth = new Auth();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'E-mail*',
            ),
            onChanged: (value) {
              this.email = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Escreva seu e-mail.';
              }
              return null;
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 24),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha*',
                helperText: 'Esqueci minha senha',
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {},
                ),
                focusColor: Colors.red,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Escreva sua senha.';
                }
                return null;
              },
              onChanged: (value) {
                this.password = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ButtonTheme(
              minWidth: double.infinity,
              child: RaisedButton(
                textColor: Theme.of(context).primaryTextTheme.button.color,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await _auth.signIn(this.email, this.password);

                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                            '${this.email}, ${this.password}; ${_auth.getCurrentUser().toString()}')));
                  }

                  // Navigator.pushNamed(context, '/');
                },
                child: Text('BORA TREINAR'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
