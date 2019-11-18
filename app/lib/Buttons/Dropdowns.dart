import 'package:flutter/material.dart';

class ChooseClassDropdown extends StatefulWidget {

    @override
    _ChooseClassDropdownState createState() {
        return _ChooseClassDropdownState();
    }

}


class _ChooseClassDropdownState extends State<ChooseClassDropdown> {
    String _value;

    List<String> classes = ["TE15", "TE16", "TE17", "TE18", "TE19"];

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
            child: DropdownButton<String>(
                icon: Icon(Icons.arrow_downward),
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
                    "Choose class",
                    style: TextStyle(
                        color: Colors.grey[800],
                    ),
                ),
                value: _value,
            ),
        );
    }
}
