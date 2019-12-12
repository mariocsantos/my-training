import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import 'package:my_training/core/auth/auth.dart';

import 'package:my_training/screens/login/bloc/login_event.dart';
import 'package:my_training/screens/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({
    @required this.authRepository,
  }) : assert(authRepository != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        await authRepository.signIn(event.email, event.password);
        yield LoginSuccess();
      } catch (error) {
        yield LoginFailure(error: error);
      }
    }

    if (event is LoginWithGoogle) {
      try {
        await authRepository.signInWithGoogle();
        yield LoginSuccess();
      } catch(error) {
        yield LoginFailure(error: error);
      }
    }

    if (event is LoginWithFacebook) {
      try {
        await authRepository.signInWithFacebook();
        yield LoginSuccess();
      } catch(error) {
        yield LoginFailure(error: error);
      }
    }
  }
}
