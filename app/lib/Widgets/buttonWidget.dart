import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {

  final String text;
  final Function onPressed;


  ButtonWidget({
    @required this.text,
    @required this.onPressed,
  });

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Colors.indigo[800],
      padding: EdgeInsets.all(20),
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: TextStyle(
          letterSpacing: 3.0,
          color: Colors.white,
          fontSize: 34.0,
        ),
      ),
    );
  }
}
