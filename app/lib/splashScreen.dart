import 'package:app/Widgets/classDropdown.dart';
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
                                    Icons.local_bar,
                                    color: Colors.white,
                                    size: 100.0,
                                ),
                                Text(
                                    "Welcome to the food rate app",
                                    style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0,
                                        color: Colors.white,
                                    ),
                                ),
                                Text(
                                    "Please fill in some information before we start!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 1.0,
                                    ),
                                ),
                                Row(
                                    children: <Widget>[
                                        Text(
                                            "Choose class",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                            ),
                                        ),
                                        SizedBox(width: 20,),
                                        ClassDropdown(),
                                    ],
                                ),
                                FlatButton(
                                    color: Colors.indigo[800],
                                    padding: EdgeInsets.all(8),
                                    onPressed: () {
                                        Navigator.of(context).pop();
                                    },
                                    child: Text(
                                        "Start",
                                        style: TextStyle(
                                            letterSpacing: 2.0,
                                            color: Colors.white,
                                            fontSize: 30.0,
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ],
                ),
            ),
        );
    }
}


