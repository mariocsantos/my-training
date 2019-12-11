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
        final user = await authRepository.signIn(event.email, event.password);
        print('user $user');
      } catch (error) {
        yield LoginFailure(error: error);
      }
    }
  }
}