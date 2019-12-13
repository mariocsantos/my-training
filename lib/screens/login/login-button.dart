import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  LoginButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: RaisedButton(
          textColor: Theme.of(context).primaryTextTheme.button.color,
          onPressed: _onPressed,
          child: Text('BORA TREINAR'),
        ),
      ),
    );
  }
}
