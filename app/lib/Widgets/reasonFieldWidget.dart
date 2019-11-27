import 'package:app/Utilities/PersistentStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReasonFieldWidget extends StatefulWidget {
    @override
    ReasonFieldState createState() => new ReasonFieldState();

}

class ReasonFieldState extends State<ReasonFieldWidget> {
    String fieldReasonValue;
    TextEditingController _controller = TextEditingController();


    @override
    Widget build(BuildContext context) {
        return Container(
            width: 200,
            child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                    labelText: "Extra response:",
                    labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        letterSpacing: 1.0,
                    ),
                ),
                onChanged: (String newValue) {
                    setState(() {
                        fieldReasonValue = newValue;
                        // Call the storage update
                        PersistentStorage.set('reasonField', fieldReasonValue);
                    });
                },
            ),
        );
    }
}