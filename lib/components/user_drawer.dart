import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_training/core/auth/auth.dart';
import 'package:my_training/core/authentication.dart';
import 'package:my_training/core/theme/theme_bloc.dart';
import 'package:my_training/core/theme/theme_event.dart';

class UserDrawer extends StatelessWidget {
  final auth = new Auth();


  // getUserHeader() {
  //   return FutureBuilder(
  //     future: auth.getCurrentUser(),
  //     builder: (context, snapshot) {
  //       user = snapshot.data;
  //       if (snapshot.connectionState == ConnectionState.done && user != null) {
  //         return UserAccountsDrawerHeader(
  //           accountName: Text(user.displayName ?? ''),
  //           accountEmail: Text(user.email),
  //           currentAccountPicture: CircleAvatar(
  //             backgroundImage:
  //                 user.photoUrl != null ? NetworkImage(user?.photoUrl) : null,
  //             backgroundColor: Colors.white.withOpacity(0.1),
  //           ),
  //         );
  //       }

  //       // TODO: return fake drawer
  //       return Text('Carregando');
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return Drawer(
      child: Column(
        children: <Widget>[
          // getUserHeader(),
          BlocListener<ThemeBloc, bool>(
            listener: (context, state) {},
            child: ListTile(
              leading: Icon(Icons.color_lens),
              trailing: Switch(
                value: themeBloc.state,
                onChanged: (value) {
                  themeBloc.add(ThemeEvent.toggle);
                },
              ),
              title: Text('Usar tema escuro?'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('Sair'),
            onTap: () {
              authBloc.add(LoggedOut());
              // this.auth.signOut();
              // Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
