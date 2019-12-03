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
    int _rating = -1;
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

    getDude(int rating) {
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

    void _showDialog() {
        Icon icon = Icon(
            getDude(_rating),
            size: 20.0,
        );
        showDialog(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("Tack!"),
                    content: Row(
                        children: <Widget>[
                            Text("Vi har tagit emot din feedback!\n"),
                            icon,
                        ],
                    ),
                    actions: <Widget>[
                        new FlatButton(
                            child: Text("Close"),
                            onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {});
                            },
                        ),
                    ],
                );
            },
        );
    }

    updateColors() {
        switch(_rating){
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
                                                    _rating = 1;
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
                                                    _rating = 2;
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
                                                    _rating = 3;
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
                                                    _rating = 4;
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
                                            width: 20,
                                        ),
                                        DropdownWidget(
                                            classes: DataStorage.reasonValues,
                                            storageKey: "reasonValue",
                                            lightTheme: true,
                                        ),
                                    ],
                                ),
                                ReasonFieldWidget(),
                                ButtonWidget(
                                    text: "Skicka in",
                                    onPressed: onSubmit,
                                    enabled: submitEnabled,
                                ),
                            ],
                        ),
                    ],
                ),
            ),
        );
    }

    onSubmit() async {
        if(!submitEnabled)
            return null;

        if(_rating == -1){
//        debugPrint("You have to give a rating");
            return null;
        }

        _showDialog();
        HttpRequest.sendFeedback(await getValues());
        PersistentStorage.set("reasonValue", null);
        PersistentStorage.set("reasonField", null);
        staffInformed = false;
        _rating = -1;
        updateColors();
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
            'rating': _rating, // replace with actual value
            'cause': reason ?? '',
            'additional_feedback': await PersistentStorage.get("reasonField") ?? '',
        };
    }
}