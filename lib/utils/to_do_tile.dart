// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String todo;
  final bool checkboxValue;
  final void Function()? onTap;
  final void Function(bool?)? onChanged;

  const ToDoTile(
      {super.key,
      required this.todo,
      required this.onTap,
      required this.checkboxValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Checkbox(
                  activeColor: Colors.black,
                  value: checkboxValue,
                  onChanged: onChanged,
                  // turns off padding and margin in checkbox
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Text(
                    todo,
                    style: TextStyle(
                        fontSize: 16.0,
                        decoration: checkboxValue
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                    overflow: TextOverflow.clip,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
