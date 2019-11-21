import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropdownWidget extends StatefulWidget {
    final List<String> classes;
    final bool lightTheme;
    final String storageKey;
    DropdownWidget({
        @required this.classes,
        @required this.storageKey,
        this.lightTheme = false
    });

    @override
    _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {

    @override
    initState() {
        super.initState();
        DropdownData.isDropdownValueSet(widget.storageKey).then((set) {
            if (set == true) {
                DropdownData.getKeyValue(widget.storageKey).then((value) {
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

        for (int i = 0; i < widget.classes.length; i++) {
            int value = i + 1;
            item = DropdownMenuItem<String>(
                child: Text(widget.classes[i]),
                value: "$value",
            );
            items.add(item);
        }
        return items;
    }

    //Updating Values
    updateValues(value) {
        currentValue = value;
        currentValueNamed = widget.classes[int.parse(currentValue) - 1];
    }

    Color getBGColor() {
        return widget.lightTheme ? Colors.white : Colors.indigo[800];
    }
    Color getTextColor() {
        return widget.lightTheme ? Colors.grey[800] : Colors.white;
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
                            color: getTextColor(),
                        ),
                        style: TextStyle(
                            color: getTextColor(),
                        ),
                        items: getMenuItems(),
                        onChanged: (String value) {
                            setState(() {
                                updateValues(value);
                            });
                            DropdownData.updateStorageDropdownValue(widget.storageKey);
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
        prefs.setString(key, _DropdownWidgetState.currentValue);
    }
}
