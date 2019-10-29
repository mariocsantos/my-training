import 'package:flutter/material.dart';

class TrainingPage extends StatefulWidget {
  @override
  TrainingPageState createState() => TrainingPageState();
}

class TrainingPageState extends State<TrainingPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: Icon(Icons.close),
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 80,
              child: Container(
                padding: EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Toque em "terminei" para contar uma série.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '0/4',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 98,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '10x',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Leg press',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 16, right: 16),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.greenAccent[700],
            label: Text('TERMINEI'),
            isExtended: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            onPressed: () {},
          ),
        ));
  }
}
