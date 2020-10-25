import 'package:flutter/material.dart';

class Cardboard extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;
  final EdgeInsets edgeInsets;

  Cardboard(this.width, this.height, this.color, this.child, this.edgeInsets);
  Widget build(BuildContext context) {
    return Container(
      margin: edgeInsets,
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
          border: Border.all(width: .1)),
      child: child,
    );
  }
}
