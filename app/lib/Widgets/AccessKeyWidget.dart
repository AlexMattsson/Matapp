import 'package:app/Utilities/PersistentStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccessKeyWidget extends StatefulWidget {
    @override
    AccessKeyState createState() => new AccessKeyState();

}

class AccessKeyState extends State<AccessKeyWidget> {
    String _fieldValue;
    TextEditingController _controller = TextEditingController();

    @override
    initState() {
        super.initState();
        PersistentStorage.get('accessField').then((value) {
            setState(() {
                _fieldValue = value;
                _controller.text = value;
            });
        });

    }
    @override
    Widget build(BuildContext context) {
        return Container(
            width: 200,
            child: TextFormField(
                obscureText: true,
                controller: _controller,
                decoration: const InputDecoration(
                    labelText: 'Access key: ',
                ),
                onChanged: (String newValue) {
                    setState(() {
                        _fieldValue = newValue;
                        // Call the storage update
                        PersistentStorage.set('accessField', _fieldValue);
                    });
                },
            ),
        );
    }
}