import 'package:app/Utilities/PersistentStorage.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
    final Map<int, String> classes;
    final bool lightTheme;
    final Function onChanged;
    final String storageKey;
    DropdownWidget({
        @required this.classes,
        @required this.storageKey,
        this.lightTheme = false,
        this.onChanged,

    });

    @override
    _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {

    @override
    initState() {
        super.initState();
        if(widget.storageKey != null) {
            PersistentStorage.isKeySet(widget.storageKey).then((set) {
                if (set == true) {
                    PersistentStorage.get(widget.storageKey).then((value) {

                            print(value);
                            setState(() {
                                updateValues(value);
                                return;
                            });
                    });
                }
            });
        }
        setState(() {
            currentValueNamed = "";
        });
    }

     String currentValue;
     String currentValueNamed;

    //Setting all items from class list
    List<DropdownMenuItem<String>> getMenuItems() {
        List<DropdownMenuItem<String>> items = [];
        DropdownMenuItem<String> item;

        for (int i = 0; i < widget.classes.length; i++) {
            int value = widget.classes.keys.toList()[i];
            item = DropdownMenuItem<String>(
                child: Text(widget.classes.values.toList()[i]),
                value: "$value",
            );
            items.add(item);
        }
        return items;
    }

    //Updating Values
    updateValues(value) {
        currentValue = value;
        currentValueNamed = widget.classes[int.parse(value) - 1];
        PersistentStorage.set(widget.storageKey, value);
    }

    Color getBGColor() {
        return widget.lightTheme ? Colors.white : Colors.indigo;
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
                            Icons.arrow_drop_down,
                            color: getTextColor(),
                        ),
                        style: TextStyle(
                            color: getTextColor(),
                        ),
                        items: getMenuItems(),
                        onChanged: (String value) {
                            setState(() {
                                updateValues(value);
                                if(widget.onChanged != null) {
                                    widget.onChanged(value);
                                }
                            });
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