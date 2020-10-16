import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'AddUserPage.dart';
import 'UserState.dart';
import 'HomePage.dart';
import 'User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {

        // エラー時に表示するWidget
        if (snapshot.hasError) {
          return Container(color: Colors.red);
        }

        // Firebaseのinitialize完了したら表示したいWidget
        if (snapshot.connectionState == ConnectionState.done) {
          return StateNotifierProvider<UsersController, UsersState>(
            create: (context) => UsersController(UsersState(users: [User(name: "tetta", text: "onegai")])),
            child: MaterialApp(
              initialRoute: ',',
              routes: <String, WidgetBuilder> {
                '/': (BuildContext context) => HomePage(),
                '/add': (BuildContext context) => AddUserPage(),
                '/b': (BuildContext context) => Container(color: Colors.blue,),
              },
            ),
          );;
        }

        // Firebaseのinitializeが完了するのを待つ間に表示するWidget
        return Container(color: Colors.blue);
      },
    );
  }
}
