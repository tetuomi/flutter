import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TalkArea extends StatefulWidget {
  @override
  _TalkArea createState() => new _TalkArea();
}

class _TalkArea extends State<TalkArea> {
  final myController = TextEditingController();
  String text = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: 300.0,
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          child: createListView(),
        ),
        TextField(
          controller: myController,
          decoration: InputDecoration(
              hintText: '入力してください'
          ),
        ),
        RaisedButton(
          child: Text("Button"),
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
          onPressed: (){
            setState((){
              text =  myController.text;
              Firestore.instance.collection('talk').add({
              'content': '$text'});
              myController.clear();
            });
          },
        ),
      ],
    );
  }

  createListView() {
    return StreamBuilder(
      stream: Firestore.instance.collection('talk').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        // エラーの場合
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        // 通信中の場合
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('Loading ...');
          default:
            return ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
                  title: new Text(document['content']),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
