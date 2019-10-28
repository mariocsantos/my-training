import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'home.dart';

class ExerciseItem extends StatefulWidget {
  ExerciseList list;
  bool first;
  bool last;
  int index;

  ExerciseItem(list, first, last, index) {
    this.list = list;
    this.first = first;
    this.last = last;
    this.index = index;
  }

  @override
  _ExerciseItemState createState() =>
      _ExerciseItemState(this.list, this.first, this.last, this.index);
}

class _ExerciseItemState extends State<ExerciseItem> {
  ExerciseList list;
  bool first;
  bool last;
  int index;

  _ExerciseItemState(list, first, last, index) {
    this.list = list;
    this.first = first;
    this.last = last;
    this.index = index;
  }

  String getSeriesAndRepetitions(Exercise exercise) {
    int series = exercise.series;
    bool seriePlural = series > 1;
    String serieName;

    int repetitions = exercise.repetitions;
    String repetitionsName = series > 1 ? 'repetições' : 'repetição';

    switch (exercise.typeSerie) {
      case 1: // series
        serieName = seriePlural ? 'séries' : 'série';
        break;
      case 2: // drop
        serieName = seriePlural ? 'drops' : 'drop';
        break;
    }

    return '$series $serieName de $repetitions $repetitionsName';
  }

  getTimeLineAlignment() {
    if (this.first) {
      return Alignment.bottomCenter;
    }

    if (this.last) {
      return Alignment.topCenter;
    }

    return Alignment.center;
  }

  getLineHeight() {
    if (this.first || this.last) {
      return 0.5;
    }

    return 1.0;
  }

  getTimeLine() {
    int index = this.index + 1;

    var circle = Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).accentColor,
      ),
      child: Text(
        index.toString(),
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Align(
            alignment: getTimeLineAlignment(),
            child: FractionallySizedBox(
              heightFactor: getLineHeight(),
              child: Container(
                width: 6,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              child: circle,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderSide borderSide = BorderSide(width: 1, color: Colors.grey[200]);
    Border border = Border(top: borderSide, bottom: borderSide);

    if (this.first) {
      border = Border(bottom: borderSide);
    }

    if (this.last) {
      border = Border(top: borderSide);
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            width: 64,
            child: getTimeLine(),
          ),
          Container(
            padding: EdgeInsets.only(left: 64),
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: BoxDecoration(
                border: border,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: list.exercises
                    .map(
                      (exercise) => Container(
                        padding: EdgeInsets.only(top: 4, bottom: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              exercise.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              getSeriesAndRepetitions(exercise),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
