import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function() press;
  final Color textColor;
  final double? height;
  const LoginButton({
    Key? key,
    required this.press,
    this.textColor = Colors.white,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: press,
      splashColor: Colors.blue,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          color: Colors.blue,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.8,
        height: height ?? size.height * 0.065,
        child: const Center(
          child: Text(
            'Sign In',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
