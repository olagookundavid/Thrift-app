import 'package:flutter/material.dart';

class ClickableButton extends StatelessWidget {
  final Function() press;
  final String text;
  final Color? color, textColor;
  final double? height;
  const ClickableButton({
    Key? key,
    required this.press,
    this.color = const Color(0xFF0072EE),
    this.textColor = Colors.white,
    this.height,
    required this.text,
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
            Radius.circular(40),
          ),
          color: Color(0xFF0072EE),
        ),
        width: size.width * 0.8,
        height: height ?? size.height * 0.08,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            )),
      ),
    );
  }
}
