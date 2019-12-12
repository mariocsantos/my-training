import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_training/core/auth/auth.dart';

import 'package:my_training/screens/home/home.dart';
import 'package:my_training/screens/login/login.dart';
import 'package:my_training/splash_screen.dart';

import 'core/theme/theme_bloc.dart';
import 'core/theme/themes.dart';

void main() {
  // Ensure any plugin is initialized
  WidgetsFlutterBinding.ensureInitialized();

  final AuthRepository authRepository = AuthRepository();

  runApp(
    BlocProvider(
      builder: (context) => AuthBloc(
        authRepository: authRepository,
      )..add(AppStarted()),
      child: App(
        authRepository: authRepository,
      ),
    ),
  );
}

class App extends StatelessWidget {
  final AuthRepository _authRepository;

  App({Key key, @required AuthRepository authRepository})
      : assert(AuthRepository != null),
        _authRepository = authRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, isDark) {
          return MaterialApp(
            title: 'My training',
            theme: getTheme(isDark),
            home: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is Uninitialized) {
                  return SplashScreen();
                }

                if (state is Authenticated) {
                  return HomePage();
                }

                return LoginScreen(authRepository: _authRepository);
              },
            ),
          );
        },
      ),
    );
  }

  ThemeData getTheme(isDark) {
    return isDark ? darkTheme : lightTheme;
  }
}
