import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  final String text;

  DisplayText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
      width: double.infinity,
    );
  }
}
