import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'UserState.dart';
import 'HomePage.dart';
import 'User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tettar'),
            bottom: TabBar(
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: [
              StateNotifierProvider<UsersController, UsersState>(
                create: (context) => UsersController(UsersState(users: [User(name: "tetta", text: "onegai")])),
                child: HomePage(),
              ),
              Container(color: Colors.blue,),
              Container(color: Colors.green,)
            ],
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'HOME', icon: Icons.home),
  const Choice(title: 'SEARCH', icon: Icons.search),
  const Choice(title: 'DM', icon: Icons.comment),
];