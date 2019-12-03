import 'package:app/Utilities/dataStorage.dart';
import 'package:app/Utilities/httpRequests.dart';
import 'package:app/Widgets/customTextWidget.dart';
import 'package:app/Widgets/dropdownWidget.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {

    @override
    _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

    static List<String> classes = ["placeholder", "placeholder", "placeholder", "placeholder"];

    @override
    initState() {
        super.initState();

        //Add stuff to the dropdown.
        HttpRequest.getClasses().then((value) {
            setState(() {
                classes.clear();
                for (int i = 0; i < value.length; i++) {
                    classes.add(value[i].className);
                }
            });

        });

    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    tooltip: "Gå tillbaka",
                    onPressed: () {
                        Navigator.of(context).pop();

                    },
                ),
                backgroundColor: Colors.indigo[800],

                title: Text(
                  "Inställningar",
                    style: TextStyle(
                        letterSpacing: 1.0
                    ),
                ),
            ),
            body: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                Row(
                                    children: <Widget>[
                                        CustomText(text: "Klass"),
                                        SizedBox(width: 20.0,),
                                        DropdownWidget(
                                            classes: classes,
                                            storageKey: "userClass",
                                            lightTheme: true,
                                        ),
                                    ],
                                ),
                                Row(
                                    children: <Widget>[
                                        CustomText(text: "Kost"),
                                        SizedBox(width: 20.0,),
                                        DropdownWidget(
                                            classes: DataStorage.dietDropdownItems,
                                            storageKey: "eatingHabit",
                                            lightTheme: true,
                                        ),
                                    ],
                                ),
                            ]
                        )
                    ],
                ),
            )
        );
    }
}