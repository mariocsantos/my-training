import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              fillColor: Color.fromRGBO(255, 255, 255, 0.1),
              filled: true,
              labelText: 'E-mail*',
            ),
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
                fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                filled: true,
                labelText: 'Senha*',
                helperText: 'Esqueci minha senha',
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {},
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Escreva sua senha.';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ButtonTheme(
              minWidth: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
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
