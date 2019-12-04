import 'dart:convert';

import 'package:app/Utilities/PersistentStorage.dart';
import 'package:app/Utilities/dataStorage.dart';
import 'package:app/Utilities/httpRequests.dart';
import 'package:app/Utilities/nti_logo_icons.dart';
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
    int rating = -1;
    bool submitEnabled = false;

    @override
    void initState() {
        // TODO: implement initState
        super.initState();
        PersistentStorage.isKeySet("firstStart").then((value) {
            if (value == false) {
                Navigator.of(context).pushNamed("/splash");
            }
        });
    }

    getRatingIcon(int rating) {
        switch(rating) {
            case 1:
                return Icons.sentiment_very_satisfied;
                break;
            case 2:
                return Icons.sentiment_satisfied;
                break;
            case 3:
                return Icons.sentiment_dissatisfied;
                break;
            case 4:
                return Icons.sentiment_very_dissatisfied;
                break;
        }
    }

    void _showDialog(Map<String, dynamic> response){
        print(response);

        print(response['cause'].length);


        Icon icon = Icon(
            getRatingIcon(rating),
            size: 25.0,
        );
        showDialog(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("Tack!"),
                    content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Text("Vi har tagit emot din feedback!"),
                            SizedBox(height: 5.0),
                            Row(
                                children: <Widget>[
                                    Text("Du valde:"),
                                    SizedBox(width: 5.0),
                                    icon,
                                ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                                children: <Widget>[
                                    Visibility(
                                        child: Text("Av anledningen: " + response['cause']),
                                        visible: response['cause'].length != 0,
                                  ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                                children: <Widget>[
                                    Visibility(
                                        child: Text("Ytterligare feedback: " + response['additional_feedback']),
                                        visible: response['additional_feedback'].length != 0,
                                  ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                                children: <Widget>[
                                    Visibility(
                                        child: Text("Personalen är " + (response['staff_informed']  ? 'informerad!' : 'inte informerad!')),
                                  ),
                              ],
                            ),
                        ],
                    ),
                    actions: <Widget>[
                        new FlatButton(
                            child: Text("Close"),
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
                submitEnabled = true;
                break;
            case 2:
                oneColor = notSelectedColor;
                twoColor = Colors.green[400];
                threeColor = notSelectedColor;
                fourColor = notSelectedColor;
                submitEnabled = true;
                break;
            case 3:
                oneColor = notSelectedColor;
                twoColor = notSelectedColor;
                threeColor = Colors.red[400];
                fourColor = notSelectedColor;
                submitEnabled = true;
                break;
            case 4:
                oneColor = notSelectedColor;
                twoColor = notSelectedColor;
                threeColor = notSelectedColor;
                fourColor = Colors.red[900];
                submitEnabled = true;
                break;
            default:
                oneColor = Colors.green[800];
                twoColor = Colors.green[400];
                threeColor = Colors.red[400];
                fourColor = Colors.red[900];
                submitEnabled = false;
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.indigo[800],
                title: Icon(
                    NtiLogo.NTI_LOGO,
                    color: Colors.white,
                    size: 36.0,
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
                                CustomText(text: "Hur var skolmaten idag?", bigText: true,),
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
                                Visibility(
                                    child: Row(
                                        children: <Widget>[
                                            CustomText(
                                                text: "Anledning",
                                            ),
                                            SizedBox(
                                                width: 20,
                                            ),
                                            DropdownWidget(
                                                classes: DataStorage.reasonValues,
                                                storageKey: 'reasonValue',
                                                lightTheme: true,
                                            ),
                                        ],
                                    ),
                                    visible: submitEnabled && rating > 2,
                                ),
                                Visibility(
                                    child: ReasonFieldWidget(),
                                    visible: submitEnabled && rating > 2,
                                ),
                                Visibility(
                                    child: Row(
                                        children: <Widget>[
                                            CustomText(
                                                text: "Har du informerat personal?",
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
                                    visible: submitEnabled,
                                ),
                                ButtonWidget(
                                    text: "Skicka in",
                                    onPressed: onSubmit,
                                    enabled: submitEnabled,
                                ),
                            ]
                        ),
                    ],
                ),
            ),
        );
    }

    onSubmit() async {
        if(!submitEnabled) {
            return null;
        }
        var response = await HttpRequest.sendFeedback(await getValues());
        if(response.statusCode == 200) {

            _showDialog(jsonDecode(response.body)['data']);
        } else if (response.statusCode == 429) {
            print("Rate limit exceeded");
            //TODO Implement rate limit response
        }
        PersistentStorage.set("reasonValue", null);
        PersistentStorage.set("reasonField", null);
        staffInformed = false;
        rating = -1;
        updateColors();
        setState(() {});
    }

    Future<Map<String, dynamic>> getValues() async {
        String reasonIndex = await PersistentStorage.get("reasonValue");
        String reason;
        if (reasonIndex != null) {
            reason = DataStorage.reasonValues[int.parse(reasonIndex)-1];
        }
        return {
            'class': await PersistentStorage.get("userClass"),
            'diet': DataStorage.dietDropdownItems[int.parse(await PersistentStorage.get("eatingHabit"))-1],
            'user': await UniqueIdentifier.serial,

            'staff_informed': staffInformed,
            'rating': rating, // replace with actual value
            'cause': reason ?? '',
            'additional_feedback': await PersistentStorage.get("reasonField") ?? '',
        };
    }
}