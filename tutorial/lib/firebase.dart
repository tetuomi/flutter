import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'talkarea.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TabBar',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('felmin'),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.tag_faces,),),
              Tab(icon: Icon(Icons.speaker_notes,),),
              Tab(icon: Icon(Icons.wc,),),
              Tab(icon: Icon(Icons.add),),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Center(
                child: Text('tetsu',),
              ),
            ),
            Container(
              color: Colors.white,
              child: new TalkArea(),
            ),
            Container(
              color: Colors.white,
            ),
            Container(
              color: Colors.white,
            ),
          ]
        ),
      ),
    );
  }
}