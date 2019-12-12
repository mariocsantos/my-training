import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_training/components/form_field.dart';
import 'package:my_training/core/auth/auth.dart';
import 'package:my_training/core/authentication.dart';
import 'package:my_training/screens/login/bloc/bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _authRepository = new AuthRepository();

  final _auth = new Auth();

  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();

  MtFormField email = new MtFormField();
  MtFormField password = new MtFormField();

  LoginBloc _loginBloc;

  Widget getEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(focus);
      },
      decoration: InputDecoration(
        labelText: 'E-mail*',
      ),
      onChanged: (value) {
        email.value = value;
      },
      validator: (value) {
        var regex = RegExp(r'^[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$');
        if (!email.isDirty) {
          return null;
        }

        if (!regex.hasMatch(value)) {
          return 'Digite um e-mail válido.';
        }

        if (value.isEmpty) {
          return 'Digite seu e-mail.';
        }

        return null;
      },
    );
  }

  Widget getPasswordField(context) {
    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.send,
      focusNode: focus,
      onFieldSubmitted: (value) {
        submit(context);
      },
      decoration: InputDecoration(
        labelText: 'Senha*',
        helperText: 'Esqueci minha senha',
        suffixIcon: IconButton(
          icon: Icon(Icons.visibility),
          onPressed: () {},
        ),
      ),
      onChanged: (value) {
        this.password.value = value;
      },
      validator: (value) {
        if (!this.password.isDirty) {
          return null;
        }

        if (value.isEmpty) {
          return 'Digite sua senha.';
        }

        return null;
      },
    );
  }

  Widget getSubmitButton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: RaisedButton(
          textColor: Theme.of(context).primaryTextTheme.button.color,
          onPressed: () {
            submit(context);
          },
          child: Text('BORA TREINAR'),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  submit(context) async {
    if (!_formKey.currentState.validate() ||
        !email.isDirty ||
        !password.isDirty) {
      return;
    }

    try {
      _loginBloc = BlocProvider.of<LoginBloc>(context);

      _loginBloc.add(
        LoginButtonPressed(
          email: email.value,
          password: password.value,
        ),
      );
    } catch (error) {
      var errorText;
      switch (error.code) {
        case 'ERROR_WRONG_PASSWORD':
          errorText =
              'Senha inválida ou o usuário não tem senha cadastrada, tente logar com a conta do google ou facebook.';
          break;
        case 'ERROR_INVALID_EMAIL':
          errorText = 'E-mail inválido.';
          break;
        case 'ERROR_USER_NOT_FOUND':
          errorText = 'Nenhum e-mail encontrado para este usuário.';
          break;
        case 'ERROR_USER_DISABLED':
          errorText = 'Este usuário foi desativado.';
          break;
        case 'ERROR_TOO_MANY_REQUESTS':
          errorText = 'Houve várias tentativas de login para este usuário.';
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          errorText = 'Este usuário não tem permissão para acessar o sistema.';
          break;
        default:
          errorText =
              'Ocorreu um erro inesperado, nosso suporte já foi avisado';
          break;
      }

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(errorText),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: BlocProvider.of<LoginBloc>(context),
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getEmailField(),
              Padding(
                padding: EdgeInsets.only(top: 24),
                child: getPasswordField(context),
              ),
              getSubmitButton(context),
            ],
          ),
        );
      },
    );
  }
}
