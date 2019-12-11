import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:my_training/core/auth/auth_repository.dart';
import 'package:my_training/core/auth/auth_event.dart';

import 'auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({@required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository;

  @override
  get initialState => Uninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedState();
    }
    
    if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } 
    
    if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthState> _mapAppStartedState() async* {
    try {
      final isSignedIn = await _authRepository.isSignedIn();

      if (isSignedIn) {
        final user = await _authRepository.getUser();
        yield Authenticated(user.email);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthState> _mapLoggedInToState() async* {
    final user = await _authRepository.getUser();
    yield Authenticated(user.email);
  }

  Stream<AuthState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _authRepository.signOut();
  }
}
