import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassDropdown extends StatefulWidget {
    @override
    _ClassDropdownState createState() {
        return _ClassDropdownState();
    }
}

class _ClassDropdownState extends State<ClassDropdown> {
    //Values passed from constructor
    String key = "userClass";
    bool light = false;
    static List<String> classes = ["TE15", "TE16", "TE17", "TE18", "TE19"];

    @override
    initState() {
        super.initState();
        DropdownData.isDropdownValueSet(key).then((set) {
            if (set == true) {
                DropdownData.getKeyValue(key).then((value) {
                    setState(() {
                        updateValues(value);
                    });
                });
            } else {
                setState(() {
                    currentValueNamed = "Välj klass";
                });
            }
        });
    }

    static String currentValue;

    static String currentValueNamed;

    //Setting all items from class list
    List<DropdownMenuItem<String>> getMenuItems() {
        List<DropdownMenuItem<String>> items = [];
        DropdownMenuItem<String> item;

        for (int i = 0; i < classes.length; i++) {
            int value = i + 1;
            item = DropdownMenuItem<String>(
                child: Text(classes[i]),
                value: "$value",
            );
            items.add(item);
        }
        return items;
    }

    //Updating Values
    updateValues(value) {
        currentValue = value;
        currentValueNamed = classes[int.parse(currentValue) - 1];
    }

    getBGColor() {
        if (light == true) {
            return Colors.white;
        } else {
            return Colors.indigo;
        }
    }
    getTextColor() {
        if (light == true) {
            return Colors.grey[800];
        } else {
            return Colors.white;
        }
    }

    @override
    Widget build(BuildContext context) {
        return Center(
            child: Container(
                child: Theme(
                    data: Theme.of(context).copyWith(
                        canvasColor: getBGColor(),
                    ),
                    child: DropdownButton<String>(
                        value: currentValue,
                        icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                        ),
                        style: TextStyle(
                            color: getTextColor(),
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
                            style: TextStyle(
                                color: Colors.white,
                            ),
                        ),
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
    static Future<String> getKeyValue(key) async {
        final prefs = await SharedPreferences.getInstance();
        String keyValue = prefs.getString(key);
        return keyValue;
    }

    //Updates the value class value at the local storage
    static updateStorageDropdownValue(key) async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(key, _ClassDropdownState.currentValue);
    }
}
