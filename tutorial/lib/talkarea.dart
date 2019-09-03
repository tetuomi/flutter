import 'package:flutter/material.dart';

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
          height: 100.0,
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          child: Text(this.text),
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
              myController.clear();
            });
          },
        ),
      ],
    );
  }
}