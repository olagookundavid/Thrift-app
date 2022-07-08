import 'package:flutter/material.dart';
import 'text_fields_container.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  const EmailInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        // cursorColor: ,
        decoration: InputDecoration(
          icon: Icon(
            icon,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Email can\'t be empty';
          }
          //email regexp matcher
          if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(text)) {
            return 'Please enter a valid email address';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
