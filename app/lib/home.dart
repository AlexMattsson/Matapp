import 'package:app/Buttons/reasonDropdowns.dart';
import 'package:flutter/material.dart';

TextEditingController controller = TextEditingController();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _askedStaff = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: Text(
          "NTI MATAPP",
        ),
      ),
      /////////////////
      ////////////////

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                        height: 70.0,
                        width: 70.0,
                        child: IconButton(
                          padding: EdgeInsets.all(0.0),
                          color: Colors.green[700],
                          icon:
                              Icon(Icons.sentiment_very_satisfied, size: 70.0),
                          onPressed: () {},
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        height: 70.0,
                        width: 70.0,
                        child: IconButton(
                          padding: EdgeInsets.all(0.0),
                          color: Colors.lime[700],
                          icon: Icon(Icons.sentiment_satisfied, size: 70.0),
                          onPressed: () {},
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        height: 70.0,
                        width: 70.0,
                        child: IconButton(
                          padding: EdgeInsets.all(0.0),
                          color: Colors.deepOrange[400],
                          icon: Icon(Icons.sentiment_dissatisfied, size: 70.0),
                          onPressed: () {},
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        height: 70.0,
                        width: 70.0,
                        child: IconButton(
                          padding: EdgeInsets.all(0.0),
                          color: Colors.red[800],
                          icon: Icon(Icons.sentiment_very_dissatisfied,
                              size: 70.0),
                          onPressed: () {},
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Informerat personsal?",
                      style: TextStyle(fontSize: 24, color: Colors.grey[800]),
                    ),
                    Checkbox(
                      onChanged: (bool resp) {
                        setState(() {
                          _askedStaff = resp;
                        });
                      },
                      value: _askedStaff,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Anledning",
                      style: TextStyle(fontSize: 24, color: Colors.grey[800]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ChooseReasonDropdown(),
                  ],
                ),
                Text(
                  "Orsak:",
                  style: TextStyle(fontSize: 24, color: Colors.grey[800]),
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
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
