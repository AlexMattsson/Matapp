import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String text;
  final bool bigText;

  CustomText({this.text, this.bigText = false});


  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
            fontSize: bigText ? 28 : 20,
            color: Colors.grey[800],
            letterSpacing: 1.0,
        ),
    );
  }
}
