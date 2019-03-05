
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/ui/no_todo.dart';

class NoToDoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NoToDo',
      home: new NotoDoHome(),
    );
  }
}

class NotoDoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("NoToDo"),
        backgroundColor: Colors.black54,
      ),
      body: new NotoDoScreen(),
    );
  }
}