import 'package:flutter/material.dart';

import 'text_fields_container.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? isbold;
  final Color? color;
  const TextInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isbold = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: TextFieldContainer(
        height: height * .055,
        color: color,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 5),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: isbold!
                  ? const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.black)
                  : const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
              border: InputBorder.none,
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'This field can\'t be empty';
              }
              //number regexp matcher
              if (!RegExp(r'(\w+)').hasMatch(text)) {
                return 'input not valid';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
      ),
    );
  }
}

class TextNumInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? color;
  final bool? isbold;
  const TextNumInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isbold = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: TextFieldContainer(
        height: height * .055,
        color: color,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 5),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: isbold!
                  ? const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.black)
                  : const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
              border: InputBorder.none,
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'This field can\'t be empty';
              }
              //number regexp matcher
              if (!RegExp(r'(\d+)').hasMatch(text)) {
                return 'input not valid';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
      ),
    );
  }
}

class TextPhoneNumInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? color;
  final bool? isbold;
  const TextPhoneNumInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isbold = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: TextFieldContainer(
        height: height * .055,
        color: color,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 5),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: isbold!
                  ? const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.black)
                  : const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
              border: InputBorder.none,
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'This field can\'t be empty';
              }
              //number regexp matcher
              if (!RegExp(r'(\d+)').hasMatch(text)) {
                return 'input not valid';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
      ),
    );
  }
}

class TextAddressInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? color;
  final bool? isbold;
  const TextAddressInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isbold = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: TextFieldContainer(
        height: height * .055,
        color: color,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 5),
          child: TextFormField(
            keyboardType: TextInputType.streetAddress,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: isbold!
                  ? const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.black)
                  : const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
              border: InputBorder.none,
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'This field can\'t be empty';
              }
              //number regexp matcher
              if (!RegExp(r'(\d+)').hasMatch(text)) {
                return 'input not valid';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
      ),
    );
  }
}
