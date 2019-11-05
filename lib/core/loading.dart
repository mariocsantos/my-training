import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: Colors.grey[900],
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}