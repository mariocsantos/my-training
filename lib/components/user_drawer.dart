import 'package:flutter/material.dart';

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Text('Drawer here'),
    );
  }
}
