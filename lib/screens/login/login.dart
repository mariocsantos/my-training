import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_training/core/auth/auth.dart';
import 'package:my_training/components/footer-link.dart';
import 'package:my_training/screens/login/facebook_login_button.dart';

import 'bloc/bloc.dart';
import 'google_login_button.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  final AuthRepository _authRepository;

  LoginScreen({Key key, @required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(key: key);

  Widget build(BuildContext context) {
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
                    left: 24,
                    right: 24,
                    top: 36,
                    bottom: 36,
                  ),
                  child: BlocProvider(
                    builder: (context) =>
                        LoginBloc(authRepository: _authRepository),
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state.isSuccess) {
                          BlocProvider.of<AuthBloc>(context).add(
                            LoggedIn(),
                          );
                        }

                        if (state.error != null) {
                          final error = _getError(state.error);

                          _onWidgetDidBuild(() {
                            Scaffold.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  content: Text(error),
                                ),
                              );
                          });
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        GoogleLoginButton(),
                                        FacebookLoginButton(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
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

  String _getError(PlatformException error) {
    switch (error.code) {
      case 'ERROR_WRONG_PASSWORD':
        return 'Senha inválida ou o usuário não tem senha cadastrada, tente logar com a conta do google ou facebook.';
        break;
      case 'ERROR_INVALID_EMAIL':
        return 'E-mail inválido.';
        break;
      case 'ERROR_USER_NOT_FOUND':
        return 'Nenhum e-mail encontrado para este usuário.';
        break;
      case 'ERROR_USER_DISABLED':
        return 'Este usuário foi desativado.';
        break;
      case 'ERROR_TOO_MANY_REQUESTS':
        return 'Houve várias tentativas de login para este usuário.';
        break;
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return 'Este usuário não tem permissão para acessar o sistema.';
        break;
      default:
        return 'Ocorreu um erro inesperado, nosso suporte já foi avisado';
        break;
    }
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
