import 'package:flutter/material.dart';
import 'package:my_training/screens/rest/rest.dart';
import 'package:my_training/screens/training/training.dart';
import './screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My training',
      theme: ThemeData(
        primaryColor: Colors.grey[900],
        accentColor: Colors.blueAccent[400]
      ),
      home: RestPage(),
    );
  }
}
