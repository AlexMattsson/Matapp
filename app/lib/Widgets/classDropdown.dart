import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassDropdown extends StatefulWidget {

    @override
    _ClassDropdownState createState() {
        return _ClassDropdownState();
    }

}

class _ClassDropdownState extends State<ClassDropdown> {


    String key = "userClass";

    @override
    initState() {
        super.initState();
        DropdownData.getUserClass(key).then((value){
            setState(() {
                updateValues(value);
            });
        });
    }

    static List<String> classes = ["TE15", "TE16", "TE17", "TE18", "TE19"];

    static String currentValue;

    static String currentValueNamed;

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


    updateValues(value) {
        currentValue = value;
        currentValueNamed = classes[int.parse(currentValue)-1];
    }

    @override
    Widget build(BuildContext context) {

        print("$currentValue , $currentValueNamed");

                  return Center(
                  child: Container(
                  child: DropdownButton<String>(
                  value: currentValue,
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
                          updateValues(value);
                      });
                      DropdownData.updateStorageDropdownValue(key);
                  },
                  hint: Text(
                      "$currentValueNamed",
                  ),
              ),
            ),
        );
    }
}

class DropdownData {

    //Returns if dropdown value is set or not.
    static Future<bool> isDropdownValueSet(key) async {
        final prefs = await SharedPreferences.getInstance();
        String userClass = prefs.getString(key);
        if (userClass == null) {
            return false;
        } else {
            return true;
        }
    }


    // Returns the value of user class from local storage
    static Future<String> getUserClass(key) async {
        final prefs = await SharedPreferences.getInstance();
        String userClass = prefs.getString(key);
        if (userClass == null) {
            return _ClassDropdownState.classes[0];
        } else {
            return userClass;
        }
    }

    //Updates the value class value at the local storage
    static updateStorageDropdownValue(key) async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(key, _ClassDropdownState.currentValue);
    }

}
