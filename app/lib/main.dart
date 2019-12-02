import 'package:app/home.dart';
import 'package:flutter/material.dart';

import 'Screens/settingsScreen.dart';
import 'Screens/splashScreen.dart';

void main() async => runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Home(),
      "/splash": (context) => SplashScreen(),
      "/settings": (context) => Settings(),
    },
));
