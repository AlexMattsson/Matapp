import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DietDropdownWidget extends StatefulWidget {
    @override
    DietDropdownState createState() => new DietDropdownState();
}

class DietDropdownState extends State<DietDropdownWidget> {
    String _dropdownValue = 'Vanlig kost';

    @override
    initState() {
        super.initState();
        this.initializeDropDownValue();
    }

    // The content of this function needs to be in a async function.
    initializeDropDownValue() async {
        final prefs = await SharedPreferences.getInstance();
        String userClass = prefs.getString('diet');
        if (userClass != null) {
            _dropdownValue = userClass;
        }
    }
    // Needs to be called from a separate
    updateStorageDropdownValue() async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('diet', _dropdownValue);
    }

    @override
    Widget build(BuildContext context) {
        return new DropdownButton<String>(
            value: _dropdownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(
                color: Colors.deepPurple
            ),
            underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
                setState(() {
                    _dropdownValue = newValue;
                    // Call the storage update
                    updateStorageDropdownValue();
                });
            },
            items: <String>['Vanlig kost', 'Vegetarisk kost', 'Vegansk kost', 'Specialkost']
                .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                );
            }).toList(),
        );
    }

}