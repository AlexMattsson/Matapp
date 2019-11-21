import 'package:app/Widgets/AccessKeyWidget.dart';
import 'package:app/Widgets/dropdownWidget.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {

    @override
    _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                    "NTI MATAPP",
                ),
            ),
            body: Container(
                child: Row(
                    children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                  Row(
                                      children: <Widget>[
                                          Text("Klass "),
                                          DropdownWidget(
                                              classes: ["TE15", "TE16", "TE17", "TE18", "TE19"],
                                              storageKey: "userClass",
                                              lightTheme: true,
                                          ),
                                      ],
                                  ),
                                  Row(
                                      children: <Widget>[
                                          Text("Kost "),
                                          DropdownWidget(
                                              classes: ["Vegetarian", "Vegan", "No Fish", "Only pizza"],
                                              storageKey: "eatingHabit",
                                              lightTheme: true,
                                          ),
                                      ],
                                  ),

                                  new AccessKeyWidget(),
                              ]
                          ),
                        )
                    ],
                ),
            )
        );
    }
}