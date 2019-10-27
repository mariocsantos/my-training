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

  @override
  Widget build(BuildContext context) {
    int index = this.index + 1;
    BorderSide borderSide = BorderSide(width: 1, color: Colors.grey[200]);
    Border border = Border(top: borderSide, bottom: borderSide);

    if(this.first) {
      border = Border(bottom: borderSide);
    }

    if (this.last) {
      border = Border(top: borderSide);
    }
    

    return Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: border,
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).accentColor,
              ),
              margin: EdgeInsets.only(
                bottom: 8,
                right: 24,
              ),
              child: Text(
                index.toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: list.exercises
                  .map(
                    (exercise) => Container(
                      padding: EdgeInsets.only(top: 4, bottom: 4,),
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
          ],
        ));
  }
}
