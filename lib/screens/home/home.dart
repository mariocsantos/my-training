import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_training/components/user_drawer.dart';

import 'exercise_item.dart';

class Training {
  String name;
  int completed;
  int total;
  List<ExerciseList> exercises;

  Training({this.name, this.completed, this.total, this.exercises});

  Training.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    completed = data['completed'];
    total = data['total'];
    if (data['exercises'] != null) {
      exercises = new List<ExerciseList>();
      data['exercises'].forEach((v) {
        exercises.add(new ExerciseList.fromJson(v));
      });
    }
  }
}

class ExerciseList {
  String date;
  int rest;
  List<Exercise> exercises;

  ExerciseList({this.date, this.rest, this.exercises});

  ExerciseList.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    rest = json['rest'];
    if (json['exercises'] != null) {
      exercises = new List<Exercise>();
      json['exercises'].forEach((v) {
        exercises.add(new Exercise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['rest'] = this.rest;
    if (this.exercises != null) {
      data['exercises'] = this.exercises.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercise {
  String name;
  int typeSerie;
  int series;
  int repetitions;

  Exercise({this.name, this.typeSerie, this.series, this.repetitions});

  Exercise.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    typeSerie = json['typeSerie'];
    series = json['series'];
    repetitions = json['repetitions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['typeSerie'] = this.typeSerie;
    data['series'] = this.series;
    data['repetitions'] = this.repetitions;
    return data;
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Training training;

  HomePageState() {
    var data =
        '{"name":"Perna + Ombro","completed":0,"total":20,"exercises":[{"date":"2019-08-11T18:12:53.506Z","rest":30,"exercises":[{"name":"Warmup","typeSerie":1,"series":4,"repetitions":10},{"name":"Warmup 2","typeSerie":2,"series":4,"repetitions":10}]}]}';
    training = Training.fromJson(json.decode(data));
  }

  String getCompletedTraining() {
    var complete = this.training.completed.toString();
    var total = this.training.total.toString();
    return 'Exercícios completados: $complete/$total';
  }

  @override
  Widget build(BuildContext context) {
    var name = this.training.name;
    var exercises = this.training.exercises;

    return Scaffold(
      appBar: AppBar(
        title: Text('My training'),
      ),
      drawer: UserDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    getCompletedTraining(),
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: exercises
                .map((exercise) => ExerciseItem(exercise, true, false, 0))
                .toList(),
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
