// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_list/pages/utils/input_field.dart';
import 'package:todo_list/pages/utils/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  final List _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 242, 248),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 242, 248),
        surfaceTintColor: Color.fromARGB(255, 243, 242, 248),
        elevation: 0.0,
        title: Text("To-Do List"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          InputField(
            controller: _controller,
            onPressed: addToDo,
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  todo: _todos[index][0],
                  onTap: () {
                    setState(() {
                      _todos.removeAt(index);
                    });
                  },
                  checkboxValue: _todos[index][1],
                  onChanged: (value) {
                    setState(() {
                      _todos[index][1] = value;
                    });
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  // Functions
  void addToDo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add([_controller.text, false]);
        _controller.clear();
      });
    }
  }
}
