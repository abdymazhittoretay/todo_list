// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  final List<String> todos;

  const ToDoList({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    // Expanded used for solve stack problem
    return Expanded(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
            child: Row(
              children: [
                Text(todos[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}
