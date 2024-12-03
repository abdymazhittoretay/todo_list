import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  final hiveBox = Hive.box("ToDoBox");

  List todos = [];

  void loadData(){
    todos = hiveBox.get("TODOLIST");
  }
  
  void updateData(){
    hiveBox.put("TODOLIST", todos);
  }
}