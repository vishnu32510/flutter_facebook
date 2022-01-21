import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;

  const CircleButton(
      {Key? key,
      required this.icon,
      required this.iconSize,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(6.0),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: iconSize,
              color: Colors.black,
            )));
  }
}
