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

  Widget getEmailField() {
    return TextFormField(
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
    );
  }

  Widget getPasswordField() {
    return TextFormField(
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
    );
  }

  Widget getSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: RaisedButton(
          textColor: Theme.of(context).primaryTextTheme.button.color,
          onPressed: submit,
          child: Text('BORA TREINAR'),
        ),
      ),
    );
  }

  submit() async {
    if (_formKey.currentState.validate()) {
      await _auth.signIn(this.email, this.password);

      Navigator.pushNamed(context, '/');

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${this.email}, ${this.password}; ${_auth.getCurrentUser().toString()}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getEmailField(),
          Padding(
            padding: EdgeInsets.only(top: 24),
            child: getPasswordField(),
          ),
          getSubmitButton(),
        ],
      ),
    );
  }
}
