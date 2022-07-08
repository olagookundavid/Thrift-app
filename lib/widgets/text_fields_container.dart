import 'package:flutter/material.dart';

// class TextFieldContainer extends StatelessWidget {
//   final Widget child;

//   final Color color;
//   const TextFieldContainer({
//     Key? key,
//     required this.child, required this.color,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 5),
//       width: size.width,
//       //* 0.8,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(5),
//         shape: BoxShape.rectangle,
//       ),
//       child: child,
//     );
//   }
// }

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final Color? color;
  const TextFieldContainer({
    Key? key,
    required this.child,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: height ?? size.height * 0.065,
      width: size.width,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
      ),
      child: child,
    );
  }
}
