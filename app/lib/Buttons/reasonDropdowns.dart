import 'package:flutter/material.dart';
import 'package:app/home.dart';

class ReasonDropdown extends StatefulWidget {
  @override
  _ReasonDropdownState createState() {
    return _ReasonDropdownState();
  }
}

class _ReasonDropdownState extends State<ReasonDropdown> {
  String _value;

  List<String> reasons = [
    "Kall mat",
    "Lång kö",
    "Ihåliga nuggets",
    "Ogillade maten",
    "Annat"
  ];

  List<DropdownMenuItem<String>> getMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    DropdownMenuItem<String> item;

    for (int i = 0; i < reasons.length; i++) {
      int value = i + 1;
      item = DropdownMenuItem<String>(
        child: Text(reasons[i]),
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
          "Choose reason",
          style: TextStyle(
            color: Colors.grey[800],
          ),
        ),
        value: _value,
      ),
    );
  }
}
/* import 'package:flutter/material.dart';

class ChooseReasonDropdown extends StatefulWidget {
  @override
  _ChooseReasonDropdownState createState() {
    return _ChooseReasonDropdownState();
  }
}

class _ChooseReasonDropdownState extends State<ChooseReasonDropdown> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        icon: Icon(Icons.arrow_downward),
        style: TextStyle(
          color: Colors.black,
        ),
        items: [
          DropdownMenuItem<String>(
            child: Text('Kall mat'),
            value: 'Kall mat',
          ),
          DropdownMenuItem<String>(
            child: Text('Lång kö'),
            value: 'Lång kö',
          ),
          DropdownMenuItem<String>(
            child: Text('Ihåliga nuggets'),
            value: 'Ihåliga nuggets',
          ),
          DropdownMenuItem<String>(
            child: Text('Ogillade maten'),
            value: 'Ogillade maten',
          ),
          DropdownMenuItem<String>(
            child: Text('Annat'),
            value: 'Annat',
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
 */
