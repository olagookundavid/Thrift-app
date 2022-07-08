import 'package:flutter/material.dart';

class ActionTile extends StatelessWidget {
  const ActionTile({
    Key? key,
    this.color,
    this.icon,
    this.text,
    required this.onpressed,
  }) : super(key: key);
  final Color? color;
  final IconData? icon;
  final String? text;
  final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        color: color ?? Colors.blue,
        width: MediaQuery.of(context).size.width / 3.05,
        height: MediaQuery.of(context).size.height / 6.5,
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Icon(
              icon ?? Icons.tag_sharp,
              size: 20,
              color: const Color(0xFFDADADA),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(text ?? 'add text here',
                style: const TextStyle(color: Color(0xFFDADADA)),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
