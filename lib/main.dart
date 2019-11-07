import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/theme_bloc.dart';

import 'routes.dart';
import 'themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, isDark) {
          return MaterialApp(
            title: 'My training',
            theme: isDark ? darkTheme : lightTheme,
            initialRoute: '/login',
            routes: routes,
          );
        },
      ),
    );
  }
}
