import 'package:app/Utilities/PersistentStorage.dart';
import 'package:app/Utilities/httpRequests.dart';
import 'package:app/Widgets/customTextWidget.dart';
import 'package:app/Widgets/reasonFieldWidget.dart';
import 'package:app/Widgets/buttonWidget.dart';
import 'package:app/Widgets/dropdownWidget.dart';
import 'package:app/Widgets/voteIcon.dart';
import 'package:flutter/material.dart';
import 'package:unique_identifier/unique_identifier.dart';


class Vote extends StatefulWidget {
  @override
  _VoteState createState() => _VoteState();
}

class _VoteState extends State<Vote> {
  bool staffInformed = false;
  Color oneColor = Colors.green[800];
  Color twoColor = Colors.green[400];
  Color threeColor = Colors.red[400];
  Color fourColor = Colors.red[900];
  Color notSelectedColor = Colors.grey[800];
  int rating;
  String _reason;
  String _field;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Success"),
          content: new Text("Du har nu skickat in din respons. Values: $rating, $staffInformed, $_reason, $_field"),
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

  updateColors() {
      switch(rating){
        case 1:
          oneColor = Colors.green[800];
          twoColor = notSelectedColor;
          threeColor = notSelectedColor;
          fourColor = notSelectedColor;
          break;
        case 2:
          oneColor = notSelectedColor;
          twoColor = Colors.green[400];
          threeColor = notSelectedColor;
          fourColor = notSelectedColor;
          break;
        case 3:
          oneColor = notSelectedColor;
          twoColor = notSelectedColor;
          threeColor = Colors.red[400];
          fourColor = notSelectedColor;
          break;
        case 4:
          oneColor = notSelectedColor;
          twoColor = notSelectedColor;
          threeColor = notSelectedColor;
          fourColor = Colors.red[900];
          break;
      }
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
                      color: oneColor,
                      onPressed: () {
                        setState(() {
                          rating = 1;
                          updateColors();
                        });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //Pretty happy dude
                    VoteIcon(
                      icon: Icons.sentiment_satisfied,
                      color: twoColor,
                      onPressed: () {
                        setState(() {
                          rating = 2;
                          updateColors();
                        });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //Little sad dude
                    VoteIcon(
                      icon: Icons.sentiment_dissatisfied,
                      color: threeColor,
                      onPressed: () {
                        setState(() {
                          rating = 3;
                          updateColors();
                        });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //Very sad dude.
                    VoteIcon(
                      icon: Icons.sentiment_very_dissatisfied,
                      color: fourColor,
                      onPressed: () {
                        setState(() {
                          rating = 4;
                          updateColors();
                        });
                      },
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    CustomText(
                      text: "Informerat personal?",
                    ),
                    Checkbox(
                      onChanged: (bool resp) {
                        setState(() {
                          staffInformed = resp;
                        });
                      },
                      value: staffInformed,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CustomText(
                      text: "Anledning",
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
                    onPressed: onSubmit
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  onSubmit() async {
      String reason = await PersistentStorage.get("reasonValue");
      String field = await PersistentStorage.get("reasonField");
      _reason = reason;
      _field = field;
      if(rating != null){
          HttpRequest.getClasses();
          _showDialog();
      } else {
          debugPrint("You have to give a rating");
      }

      HttpRequest.sendFeedback(await getValues());
  }

  Future<Map<String, dynamic>> getValues() async {
    return {
        'class': await PersistentStorage.get("userClass"),
        'diet': await PersistentStorage.get("eatingHabit"),
        'user': await UniqueIdentifier.serial,

        'staff_informed': staffInformed,
        'rating': rating, // replace with actual value
        'cause': await PersistentStorage.get("reasonValue"),
        'additional_feedback': await PersistentStorage.get("reasonField"),
    };
  }
}