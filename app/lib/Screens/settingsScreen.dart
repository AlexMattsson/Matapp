import 'package:app/Utilities/httpRequests.dart';
import 'package:app/Widgets/customTextWidget.dart';
import 'package:app/Widgets/dropdownWidget.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {

    @override
    _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

    static List<String> classes = ["bestClass", "placehonder", "placehonder", "placehonder"];

    @override
    initState() {
        super.initState();

        //Add stuff to the dropdown.
        HttpRequests.getClasses().then((value) {
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
                                            CustomText(text: "Klass",),
                                            DropdownWidget(
                                                classes: classes,
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
                                ]
                            ),
                        )
                    ],
                ),
            )
        );
    }
}