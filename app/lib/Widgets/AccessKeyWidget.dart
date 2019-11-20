import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccessKeyWidget extends StatefulWidget {
    @override
    AccessKeyState createState() => new AccessKeyState();

}

class AccessKeyState extends State<AccessKeyWidget> {
    String _fieldValue = 'init val';
    TextEditingController _controller = TextEditingController();

    @override
    initState() {
        super.initState();
        this.initializeDropDownValue();
    }

    // The content of this function needs to be in a async function.
    initializeDropDownValue() async {
        final prefs = await SharedPreferences.getInstance();
        String userClass = prefs.getString('accessField');
        if (userClass != null) {
            _fieldValue = userClass;
        }
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            width: 200,
            child: TextFormField(
                obscureText: true,
                initialValue: _fieldValue,
                decoration: const InputDecoration(
                    labelText: 'Access key: ',
                ),
                onChanged: (String newValue) {
                    setState(() {
                        _fieldValue = newValue;
                        // Call the storage update
                        updateStorageDropdownValue();
                    });
                },
            ),
        );
    }

    updateStorageDropdownValue() async {
        final prefs = await SharedPreferences.getInstance();
        print(_fieldValue);
        prefs.setString('accessField', _fieldValue);
    }
}