import 'package:flutter/material.dart';
import 'package:my_training/components/user_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int total;
  int completed;
  String training;

  HomePageState() {
    this.total = 20;
    this.completed = 0;
    this.training = 'Perna + Ombro';
  }

  String getCompletedTraining() {
    return 'Exercícios completados: ' +
        this.completed.toString() +
        '/' +
        this.total.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My training'),
      ),
      drawer: UserDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.training,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                Text(
                  getCompletedTraining(),
                  style: TextStyle(
                    fontSize: 14
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Começar',
        child: Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
