import 'package:flutter/material.dart';

class ChangeButton extends StatelessWidget {
  final Function stateHandler;

  ChangeButton(this.stateHandler);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: stateHandler,
      child: Text('Change Text'),
    );
  }
}
