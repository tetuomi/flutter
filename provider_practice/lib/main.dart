import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
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
    );
  }
}
