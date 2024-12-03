// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;

  final void Function()? onPressed;

  const InputField(
      {super.key, required this.controller, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        children: [
          inputText(),
          SizedBox(
            width: 20.0,
          ),
          addButton()
        ],
      ),
    );
  }

  Expanded inputText() {
    return Expanded(
      child: TextField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        controller: controller,
        decoration: InputDecoration(
            hintText: "Enter your To-Do",
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }

  Widget addButton() {
    return IconButton(
        tooltip: "Add",
        style: IconButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
        onPressed: onPressed,
        icon: Icon(
          Icons.add,
          color: Colors.white,
          size: 40.0,
        ));
  }
}
