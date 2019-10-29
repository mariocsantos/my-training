import './screens/login/login.dart';
import './screens/home/home.dart';
import './screens/training/training.dart';
import './screens/rest/rest.dart';

var routes = {
  '/': (context) => HomePage(),
  '/login': (context) => LoginPage(),
  '/training': (context) => TrainingPage(),
  '/rest': (context) => RestPage(),
};