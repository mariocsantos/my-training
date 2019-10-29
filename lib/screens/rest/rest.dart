import 'package:flutter/material.dart';

class RestPage extends StatefulWidget {
  @override
  RestPageState createState() => RestPageState();
}

class RestPageState extends State<RestPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: Align(
          alignment: Alignment.center,
        ));
  }
}
