import 'package:flutter/material.dart';

import 'routes.dart';
import 'themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My training',
      theme: darkTheme,
      darkTheme: darkTheme,
      initialRoute: '/login',
      routes: routes,
    );
  }
}
