// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:todo_list/data/database.dart';
import 'package:todo_list/services/notification_service.dart';
import 'package:todo_list/utils/input_field.dart';
import 'package:todo_list/utils/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  final hiveBox = Hive.box("ToDoBox");

  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (hiveBox.get("TODOLIST") != null) {
      db.loadData();
    }

    super.initState();
  }

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
        children: [
          InputField(
            controller: _controller,
            onPressed: addToDo,
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: db.todos.isNotEmpty
                ? ListView.builder(
                    itemCount: db.todos.length,
                    itemBuilder: (context, index) {
                      return ToDoTile(
                        todo: db.todos[index][0],
                        onTap: () {
                          NotificationService()
                              .deleteNotification(id: db.todos[index][2]);
                          setState(() {
                            db.todos.removeAt(index);
                          });
                          db.updateData();
                        },
                        checkboxValue: db.todos[index][1],
                        onChanged: (value) {
                          setState(() {
                            db.todos[index][1] = value;
                          });
                          db.updateData();
                        },
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "There are no todos yet...",
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                  ),
          )
        ],
      ),
    );
  }

  // Functions
  void addToDo() {
    if (_controller.text.isNotEmpty) {
      final int id = tz.TZDateTime.now(tz.local).year +
          tz.TZDateTime.now(tz.local).month +
          tz.TZDateTime.now(tz.local).day +
          tz.TZDateTime.now(tz.local).hour +
          tz.TZDateTime.now(tz.local).minute +
          tz.TZDateTime.now(tz.local).second;
      NotificationService().scheduledNotification(
        id: id,
        title: "To Do",
        body: _controller.text,
        hour: scheduleNotificationHour(tz.TZDateTime.now(tz.local).hour + 4),
        minute: 0,
      );
      setState(() {
        db.todos.insert(
          0,
          [
            _controller.text,
            false,
            id,
          ],
        );
        _controller.clear();
      });
      db.updateData();
    }
  }

  int scheduleNotificationHour(int hour) {
    if (hour > 23) {
      return hour - 23;
    }
    return hour;
  }
}
