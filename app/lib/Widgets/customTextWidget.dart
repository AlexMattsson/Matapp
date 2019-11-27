import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String text;

  CustomText({this.text});


  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
            fontSize: 24,
            color: Colors.grey[800],
            letterSpacing: 1.0,
        ),
    );
  }
}
