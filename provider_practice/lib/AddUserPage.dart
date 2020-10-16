import 'package:flutter/material.dart';
import 'UserState.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUserPage extends StatelessWidget {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('users').add({
                      'name': "tettta",
                      'text': '${_textEditingController.value.text}'
                    });
                    context.read<UsersController>()
                        .addUser("tetta", _textEditingController.value.text);
                    _textEditingController.text = '';
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Add user",
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "new tweet",
                    hintText: "What are you doing?",
                  ),
                  maxLength: 140,
                ),
              ]
          )
      ),
    );
  }
}