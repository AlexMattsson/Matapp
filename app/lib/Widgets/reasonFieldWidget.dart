import 'package:app/Utilities/PersistentStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReasonFieldWidget extends StatefulWidget {
    @override
    ReasonFieldState createState() => new ReasonFieldState();

}

class ReasonFieldState extends State<ReasonFieldWidget> {
    String _fieldReasonValue;
    TextEditingController _controller = TextEditingController();


    @override
    Widget build(BuildContext context) {
        return Container(
            width: 200,
            child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                    labelText: 'Ytterligare anledningar:',
                ),
                onChanged: (String newValue) {
                    setState(() {
                        _fieldReasonValue = newValue;
                        // Call the storage update
                        PersistentStorage.set('reasonField', _fieldReasonValue);
                    });
                },
            ),
        );
    }
}