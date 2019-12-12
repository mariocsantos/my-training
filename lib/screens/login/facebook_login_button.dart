import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_training/components/custom_icons.dart';

import 'bloc/bloc.dart';

class FacebookLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue[700],
      foregroundColor: Colors.white,
      onPressed: () {
        try {
          BlocProvider.of<LoginBloc>(context).add(
            LoginWithFacebook(),
          );
        } catch (error) {
          print(error);
        }
      },
      child: Icon(CustomIcons.facebook),
      heroTag: 'loginFacebook',
    );
  }
}
