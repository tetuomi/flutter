import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UserState.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = context.watch<UsersState>().users;
    // TODO: implement build
    return Scaffold(
      body:ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int i) {
          return Card(
            child: ListTile(
              title: Text(users[i].name),
              subtitle: Text(users[i].text),
            ),
          );
        },),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.read<UsersController>().addUser("newName", "newText"),
        label: Text('Add'),
        icon: Icon(Icons.add),
      ),
    );
  }
}