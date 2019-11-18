import 'package:flutter/material.dart';

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
