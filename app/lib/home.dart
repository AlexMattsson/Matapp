import 'package:flutter/material.dart';

import 'Widgets/classDropdown.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    DropdownData.isDropdownValueSet("userClass").then((value) {
      print("is the value set? $value");
      if (value == false) {
        Navigator.of(context).pushReplacementNamed("/splash");
      }
    });

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigo[800],
            title: Text(
                "NTI MATAPP",
            ),
            actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.settings),
                    tooltip: "Öppna inställningar",
                    onPressed: () {
                        Navigator.of(context).pushNamed("/settings");
                    },
                )
            ],
        ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                /* Text(
                  'matapp',
                  style: TextStyle(fontSize: 25, color: Colors.deepPurple[900]),
                ), */
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.all(1.0),
                      icon: Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.green[700],
                        size: 70,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    IconButton(
                      padding: EdgeInsets.all(1.0),
                      icon: Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.lime[700],
                        size: 70,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    IconButton(
                      padding: EdgeInsets.all(1.0),
                      icon: Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.deepOrange[400],
                        size: 70,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    IconButton(
                      padding: EdgeInsets.all(1.0),
                      icon: Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red[800],
                        size: 70,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                Text(
                  "Informerat personal?",
                  style: TextStyle(fontSize: 25, color: Colors.grey[800]),
                ),
                Text(
                  "Anledning",
                  style: TextStyle(fontSize: 25, color: Colors.grey[800]),
                ),
                FlatButton(
                  color: Colors.indigo[900],
                  textColor: Colors.white,
                  disabledColor: Colors.indigo[800],
                  disabledTextColor: Colors.white,
                  //padding: EdgeInsets.all(8.0),
                  //splashColor: Colors.blueAccent,
                  child: Text(
                    'Skicka in',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
