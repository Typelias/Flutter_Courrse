import 'package:flutter/material.dart';
import 'package:flutter_assignment/changeButton.dart';
import 'package:flutter_assignment/displayText.dart';

class ControllWidget extends StatefulWidget {
  @override
  _ControllWidgetState createState() => _ControllWidgetState();
}

class _ControllWidgetState extends State<ControllWidget> {
  var _text = "Hello World!";

  void _changeText() {
    setState(() {
      _text = "Hello Greger!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DisplayText(_text),
        ChangeButton(_changeText),
      ],
    );
  }
}
