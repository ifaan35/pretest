import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final double width;
  final String text;
  final Color btnColor;
  final Color btnTextColor;
  final VoidCallback?
      onPressed; // Make onPressed optional with the use of VoidCallback?

  const CustomBtn({
    required this.width,
    required this.text,
    required this.btnColor,
    required this.btnTextColor,
    this.onPressed, // Update here
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: btnTextColor, fontSize: 18),
        ),
      ),
    );
  }
}
