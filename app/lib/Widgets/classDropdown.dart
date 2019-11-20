import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassDropdown extends StatefulWidget {

    @override
    _ClassDropdownState createState() {
        return _ClassDropdownState();
    }

}

class _ClassDropdownState extends State<ClassDropdown> {

    static List<String> classes = ["TE15", "TE16", "TE17", "TE18", "TE19"];

    static String _value;

    List<DropdownMenuItem<String>> getMenuItems() {
        List<DropdownMenuItem<String>> items = [];
        DropdownMenuItem<String> item;

        for (int i=0;i<classes.length;i++) {
            int value = i+1;
            item = DropdownMenuItem<String>(
                child: Text(classes[i]),
                value: "$value",
            );
            items.add(item);
        }
        return items;

    }



    @override
    Widget build(BuildContext context) {
        return Center(
            child: Container(
              child: DropdownButton<String>(
                  icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                  ),
                  style: TextStyle(
                      color: Colors.grey[800],
                  ),

                  items: getMenuItems(),
                  onChanged: (String value) {
                      setState(() {
                          _value = value;
                      });
                  },
                  hint: Text(
                      "TE15",
                      style: TextStyle(
                          color: Colors.white,
                      ),
                  ),
                  value: _value,
              ),
            ),
        );
    }
}

class DropdownData {
    static String _dropdownValue = _ClassDropdownState._value;

    static Future<bool> isDropdownValueSet() async {
        final prefs = await SharedPreferences.getInstance();
        String userClass = prefs.getString('userClass');
        if (userClass == null) {
            return false;
        } else {
            return true;
        }

    }

    static initializeDropDownValue() async {
        final prefs = await SharedPreferences.getInstance();
        String userClass = prefs.getString('userClass');
        print("Setting dropdown data to $_dropdownValue");
        if (userClass != null) {
            _dropdownValue = userClass;
        }
    }
    // Needs to be called from a separate
    static updateStorageDropdownValue() async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('userClass', _dropdownValue);
    }

}
