


import 'package:todolist/to_do.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.purple[900],
    ),
    home: const ToDoList(),
  ));
}

