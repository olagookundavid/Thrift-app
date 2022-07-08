import 'package:flutter/material.dart';

import 'text_fields_container.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<PasswordTextField> {
  bool isPassCodeVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: widget.controller,
        obscureText: isPassCodeVisible,
        decoration: InputDecoration(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
          ),
          suffixIcon: IconButton(
            tooltip: 'toggle visibility',
            icon: isPassCodeVisible
                ? const Icon(
                    Icons.visibility_off,
                  )
                : const Icon(
                    Icons.visibility,
                  ),
            onPressed: () {
              setState(() {
                isPassCodeVisible = !isPassCodeVisible;
              });
            },
          ),
          border: InputBorder.none,
        ),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Password can\'t be empty';
          }
          if (text.length < 6) {
            return 'Password can\'t be less than 6 words';
          }
          //password regexp matcher
          if (RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>')
              .hasMatch(text)) {
            return 'Password not valid';
          }
          return null;
        },
      ),
    );
  }
}
