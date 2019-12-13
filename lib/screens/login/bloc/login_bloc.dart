import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import 'package:my_training/core/auth/auth.dart';

import 'package:my_training/screens/login/bloc/login_event.dart';
import 'package:my_training/screens/login/bloc/login_state.dart';

import 'validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({
    @required this.authRepository,
  }) : assert(authRepository != null);

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield state.update(
        isEmailValid: Validators.isValidEmail(event.email),
      );
    }

    if (event is PasswordChanged) {
      yield state.update(
        isPasswordValid: Validators.isValidPassword(event.password),
      );
    }

    if (event is LoginButtonPressed) {
      yield LoginState.loading();

      try {
        await authRepository.signIn(event.email, event.password);
        yield LoginState.success();
      } catch (error) {
        yield LoginState.failure(error);
      }
    }

    if (event is LoginWithGoogle) {
      try {
        await authRepository.signInWithGoogle();
        yield LoginState.success();
      } catch (error) {
        yield LoginState.failure(error);
      }
    }

    if (event is LoginWithFacebook) {
      try {
        await authRepository.signInWithFacebook();
        yield LoginState.success();
      } catch (error) {
        yield LoginState.failure(error);
      }
    }
  }
}
