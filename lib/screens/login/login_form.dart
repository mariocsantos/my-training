import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_training/screens/login/bloc/bloc.dart';

import 'login-button.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode focus = FocusNode();

  LoginBloc _loginBloc;
  bool isObscureText = true;

  @override
  void initState() {
    super.initState();
    this._loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _loginBloc,
      builder: (context, state) {
        return Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(focus);
                },
                decoration: InputDecoration(
                  labelText: 'E-mail*',
                ),
                onChanged: (value) => _onEmailChanged(),
                autovalidate: true,
                validator: (value) {
                  if (!state.isEmailDirty) {
                    return null;
                  }

                  if (value.isEmpty) {
                    return 'Digite seu e-mail.';
                  }

                  if (!state.isEmailValid) {
                    return 'Digite um e-mail válido.';
                  }

                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 24),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: isObscureText,
                  textInputAction: TextInputAction.send,
                  focusNode: focus,
                  autovalidate: true,
                  onFieldSubmitted: (value) => _onSubmit(),
                  decoration: InputDecoration(
                    labelText: 'Senha*',
                    helperText: 'Esqueci minha senha',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) => _onPasswordChanged(),
                  validator: (value) {
                    if (!state.isPasswordDirty) {
                      return null;
                    }

                    if (value.isEmpty) {
                      return 'Escreva sua senha.';
                    }

                    return null;
                  },
                ),
              ),
              LoginButton(
                onPressed: _onSubmit,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_loginBloc.state.isFormValid) {
      return;
    }

    try {
      _loginBloc = BlocProvider.of<LoginBloc>(context);

      _loginBloc.add(
        LoginButtonPressed(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    } catch (error) {
      
    }
  }

  void _onEmailChanged() {
    _loginBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }
}
