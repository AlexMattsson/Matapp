import 'package:app/Utilities/PersistentStorage.dart';
import 'package:app/Widgets/reasonFieldWidget.dart';
import 'package:app/Widgets/buttonWidget.dart';
import 'package:app/Widgets/dropdownWidget.dart';
import 'package:app/Widgets/voteIcon.dart';
import 'package:flutter/material.dart';


class Vote extends StatefulWidget {
  @override
  _VoteState createState() => _VoteState();
}

class _VoteState extends State<Vote> {
  bool _askedStaff = false;
  Color _goodColor = Colors.green[800];
  Color _okColor = Colors.green[400];
  Color _dissatisfiedColor = Colors.red[400];
  Color _badColor = Colors.red[900];
  int _rating;
  String _reason;
  String _field;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Success"),
          content: new Text("Du har nu skickat in din respons. Values: $_rating, $_askedStaff, $_reason, $_field"),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //Very happy dude
                    VoteIcon(
                      icon: Icons.sentiment_very_satisfied,
                      color: _goodColor,
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
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //Pretty happy dude
                    VoteIcon(
                      icon: Icons.sentiment_dissatisfied,
                      color: _okColor,
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
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //Little sad dude
                    VoteIcon(
                      icon: Icons.sentiment_dissatisfied,
                      color: _dissatisfiedColor,
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
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //Very sad dude.
                    VoteIcon(
                      icon: Icons.sentiment_very_dissatisfied,
                      color: _badColor,
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
                    ),
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
                      classes: ["Kall mat", "Lång Kö", "Ihåliga Nuggets", "Ogillade Maten", "Annat"],
                      storageKey: "reasonValue",
                      lightTheme: true,
                    ),
                  ],
                ),
                ReasonFieldWidget(),
                ButtonWidget(
                    text: "Skicka in",
                    onPressed: () async {
                      String reason = await PersistentStorage.get("reasonValue");
                      String field = await PersistentStorage.get("reasonField");
                      _reason = reason;
                      _field = field;
                      if(_rating != null){
                        _showDialog();
                      } else {
                        debugPrint("You have to give a rating");
                      }
                    }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}