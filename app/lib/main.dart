import 'package:app/splashScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/settingsScreen.dart';
import 'home.dart';

void main() async => runApp(MaterialApp(
    initialRoute: "/splash",
    routes: {
      "/": (context) => Home(),
      "/splash": (context) => SplashScreen(),
        "/settings": (context) => Settings(),
    },
));
