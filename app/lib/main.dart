import 'package:app/Screens/voteScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/settingsScreen.dart';
import 'Screens/splashScreen.dart';

void main() async => runApp(MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => Vote(),
        "/splash": (context) => SplashScreen(),
        "/settings": (context) => Settings(),
      },
    ));
