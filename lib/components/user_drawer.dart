import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_training/core/authentication.dart';

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  final auth = new Auth();

  FirebaseUser user;

  getUserHeader() {
    return FutureBuilder(
      future: auth.getCurrentUser(),
      builder: (context, snapshot) {
        user = snapshot.data;
        if (snapshot.connectionState == ConnectionState.done && user != null) {
          return UserAccountsDrawerHeader(
            accountName: Text(user.displayName ?? ''),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: user.photoUrl != null ? NetworkImage(user?.photoUrl) : null,
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
          );
        }

        // TODO: return fake drawer
        return Text('Carregando');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          getUserHeader(),
          ListTile(
            leading: Icon(Icons.color_lens),
            trailing: Switch(
              value: false,
              onChanged: (value) {
                // set theme mode
              },
            ),
            title: Text('Usar tema escuro?'),
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('Sair'),
            onTap: () {
              this.auth.signOut();
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
