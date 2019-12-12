import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_training/components/custom_icons.dart';

import 'bloc/bloc.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24),
      child: FloatingActionButton(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        onPressed: () {
          try {
            BlocProvider.of<LoginBloc>(context).add(
              LoginWithGoogle(),
            );
          } catch (error) {
            print(error);
          }
        },
        child: Icon(CustomIcons.google),
        heroTag: 'loginGoogle',
      ),
    );
  }
}
