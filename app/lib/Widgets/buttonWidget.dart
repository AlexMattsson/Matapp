import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatefulWidget {

  final String text;
  final Function onPressed;
  bool enabled = false;

  ButtonWidget({
    @required this.text,
    @required this.onPressed,
    this.enabled = false,
  });

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {

    Color getButtonColor() {
        return widget.enabled ? Colors.indigo[800] : Colors.indigo[200];
    }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: getButtonColor(),
      padding: EdgeInsets.all(20),
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: TextStyle(
          letterSpacing: 3.0,
          color: Colors.white,
          fontFamily: 'Dalton Maag',
          fontSize: 34.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
