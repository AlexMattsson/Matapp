import 'package:app/Widgets/ClassDropdown.dart';
import 'package:app/Widgets/classDropdown.dart' as prefix0;
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                                Row(
                                    children: <Widget>[
                                        Text("Klass "),
                                        prefix0.ClassDropdown(
                                            classes: ["TE15", "TE16", "TE17", "TE18", "TE19"],
                                            storageKey: "userClass",
                                            lightTheme: true,
                                        ),
                                    ],
                                )
                            ]
                        )
                    ],
                ),
            )
        );
    }
}