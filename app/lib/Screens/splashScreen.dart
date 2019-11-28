import 'package:app/Utilities/dataStorage.dart';
import 'package:app/Utilities/nti_logo_icons.dart';
import 'package:app/Widgets/buttonWidget.dart';
import 'package:app/Widgets/dropdownWidget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{

    @override
    _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            backgroundColor: Colors.blue,
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/SplashBG.png"),
                        fit: BoxFit.cover,
                    ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                                Icon( //Logo
                                    NtiLogo.NTI_LOGO,
                                    color: Colors.white,
                                    size: 200.0,
                                ),
                                Text(
                                    "Välkommen till Matappen!",
                                    style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0,
                                        color: Colors.white,
                                    ),
                                ),
                                Text(
                                    "Vänligen fyll i lite information innan vi kör igång!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 1.0,
                                    ),
                                ),
                                Row(
                                    children: <Widget>[
                                        Text(
                                            "Klass:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                letterSpacing: 1.0,
                                            ),
                                        ),
                                        SizedBox(width: 10,),
                                        DropdownWidget(
                                            classes: ["TE15", "TE16", "TE17", "TE18", "TE19"],
                                            storageKey: "userClass",
                                            lightTheme: false,
                                        ),
                                   ],
                                ),
                                Row(
                                  children: <Widget>[
                                      Text(
                                          "Specialkost:",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              letterSpacing: 1.0,
                                          ),
                                      ),
                                      SizedBox(width: 10,),
                                      new DropdownWidget(
                                          classes: DataStorage.dietDropdownItems,
                                          storageKey: "eatingHabit",
                                          lightTheme: false,
                                      ),
                                  ],
                                ),
                                ButtonWidget(
                                    text: "Bekräfta",
                                    onPressed: () {
                                        Navigator.of(context).pop();
                                    },
                                ),
                            ],
                        ),
                    ],
                ),
            ),
        );
    }
}


