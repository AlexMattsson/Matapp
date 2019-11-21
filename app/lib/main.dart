import 'package:flutter/material.dart';

import 'Screens/settingsScreen.dart';
import 'Screens/splashScreen.dart';
import 'home.dart';

void main() async => runApp(MaterialApp(
    initialRoute: "/splash",
    routes: {
      "/": (context) => Home(),
      "/splash": (context) => SplashScreen(),
        "/settings": (context) => Settings(),
    },
));
