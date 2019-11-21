import 'package:app/Utilities/PersistentStorage.dart';
import 'package:app/Widgets/dropdownWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        print('Field value: $_fieldValue');
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
                        updateStorageDropdownValue();

                    });
                },
            ),
        );
    }

    updateStorageDropdownValue() async {
        final prefs = await SharedPreferences.getInstance();
//        print(_fieldValue);
        prefs.setString('accessField', _fieldValue);
    }
}