import 'package:flutter/material.dart';
import 'package:flutter_demo_app/model/user.dart';
import 'package:flutter_demo_app/ui/Home.dart';
import 'package:flutter_demo_app/ui/container_demo.dart';
import 'package:flutter_demo_app/ui/no_todo_app.dart';
import 'package:flutter_demo_app/util/database_helper.dart';
import './ui/make_rain.dart';
import './ui/test_gesture_detector.dart';
import './ui/login_form.dart';
import './ui/klimatic.dart';

List _users;

void main() async {

  // DB HELPER TEST
  //---------------------
  var db = DatabaseHelper();
  //Add user
  int savedUser = await db.saveUser(User("Anjali", "anjali"));
  _users = await db.getAllUsers();
  for (int i = 0; i < _users.length; i++) {
    User user = User.map(_users[i]);
    print("Username : ${user.username}   ID : ${user.id}");
  }

  //get count
  int count = await db.getCount();
  print("Count : $count");

  // get user
  User user = await db.getUser(1);
  print("User : ${user.username} , id : ${user.id}");

  //delete user
  int deleteUser = await db.deleteUser(2);
  print("Deleted user : ${deleteUser}");

  //update user1
  User user1 = await db.getUser(1);
  User updatedUser1 = User.fromMap({
    "username" : "anji",
    "password" : "anjipassword",
    "id" : 1
  });
  await db.updateUser(updatedUser1);

  //---------------------


// Klimatic app
//  runApp(new MaterialApp(title: "Test",
//      color: Colors.greenAccent,
//      home: new Klimatic()));


  // Notodo app
  runApp(new NoToDoApp());
}