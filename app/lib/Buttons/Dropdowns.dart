import 'package:flutter/material.dart';

class ChooseClassDropdown extends StatefulWidget {
  @override
  _ChooseClassDropdownState createState() {
    return _ChooseClassDropdownState();
  }
}

class _ChooseClassDropdownState extends State<ChooseClassDropdown> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        icon: Icon(Icons.arrow_downward),
        style: TextStyle(
          color: Colors.white,
        ),
        items: [
          DropdownMenuItem<String>(
            child: Text('Item 1'),
            value: 'one',
          ),
          DropdownMenuItem<String>(
            child: Text('Item 2'),
            value: 'two',
          ),
          DropdownMenuItem<String>(
            child: Text('Item 3'),
            value: 'three',
          ),
        ],
        onChanged: (String value) {
          setState(() {
            _value = value;
          });
        },
        hint: Text('Select Item'),
        value: _value,
      ),
    );
  }
}
