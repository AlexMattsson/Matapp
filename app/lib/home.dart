import 'package:app/Utilities/PersistentStorage.dart';
import 'package:app/Widgets/dropdownWidget.dart';
import 'package:flutter/material.dart';


TextEditingController controller = TextEditingController();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _askedStaff = false;
  Color _goodColor = Colors.green[700];
  Color _okColor = Colors.lime[700];
  Color _dissatisfiedColor = Colors.deepOrange[400];
  Color _badColor = Colors.red[800];
  int _rating;
  String _reason;
  bool _buttonEnabled;
  //String _value;
  //String reasons;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Success"),
          content: new Text("Su har nu skickat in din respons. Values: $_rating, $_askedStaff, $_reason"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {

    PersistentStorage.isKeySet("userClass").then((value) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                        height: 70.0,
                        width: 70.0,
                        child: IconButton(
                          padding: EdgeInsets.all(0.0),
                          color: _goodColor,
                          icon: Icon(
                            Icons.sentiment_very_satisfied,
                            size: 70.0,
                          ),
                          onPressed: () {
                            setState(() {
                              _rating = 3;
                              _goodColor = Colors.black;
                              if (_rating == 3) {
                                _okColor = Colors.lime[700];
                                _dissatisfiedColor = Colors.deepOrange[400];
                                _badColor = Colors.red[800];
                              }
                            });
                          },
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        height: 70.0,
                        width: 70.0,
                        child: IconButton(
                          padding: EdgeInsets.all(0.0),
                          color: _okColor,
                          icon: Icon(Icons.sentiment_satisfied, size: 70.0),
                          onPressed: () {
                            setState(() {
                              _rating = 2;
                              _okColor = Colors.black;
                              if (_rating == 2) {
                                _goodColor = Colors.green[700];
                                _dissatisfiedColor = Colors.deepOrange[400];
                                _badColor = Colors.red[800];
                              }
                            });
                          },
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        height: 70.0,
                        width: 70.0,
                        child: IconButton(
                          padding: EdgeInsets.all(0.0),
                          //color: Colors.deepOrange[400],
                          color: _dissatisfiedColor,
                          icon: Icon(Icons.sentiment_dissatisfied, size: 70.0),
                          onPressed: () {
                            setState(() {
                              _rating = 1;
                              _dissatisfiedColor = Colors.black;
                              if (_rating == 1) {
                                _goodColor = Colors.green[700];
                                _okColor = Colors.lime[700];
                                _badColor = Colors.red[800];
                              }
                            });
                          },
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        height: 70.0,
                        width: 70.0,
                        child: IconButton(
                          padding: EdgeInsets.all(0.0),
                          color: _badColor,
                          icon: Icon(Icons.sentiment_very_dissatisfied,
                              size: 70.0),
                          onPressed: () {
                            setState(() {
                              _rating = 0;
                              _badColor = Colors.black;
                              if (_rating == 0) {
                                _goodColor = Colors.green[700];
                                _okColor = Colors.lime[700];
                                _dissatisfiedColor = Colors.deepOrange[400];
                              }
                            });
                          },
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Informerat personal?",
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
                    DropdownWidget(
                      classes: ["badFood", "vegan", "fish",],
                      storageKey: "reasonValue",
                      lightTheme: true,
                    ),
                  ],
                ),
                Text(
                  "Orsak:",
                  style: TextStyle(fontSize: 24, color: Colors.grey[800]),
                ),
                FlatButton(
                    color: Colors.indigo[900],
                    textColor: Colors.white,
                    disabledColor: Colors.green[300],
                    disabledTextColor: Colors.white,
                    //padding: EdgeInsets.all(8.0),
                    //splashColor: Colors.blueAccent,
                    child: Text(
                      'Skicka in',
                      style: TextStyle(fontSize: 24),

                    ),
                    onPressed: () async {
                      String reason = await PersistentStorage.get("reasonValue");
                      _reason = reason;
                      if(_rating != null){
                        _showDialog();
                      } else {
                        debugPrint("You have to give a rating");
                      }
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
