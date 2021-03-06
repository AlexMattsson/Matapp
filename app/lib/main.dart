import 'package:app/Screens/voteScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/settingsScreen.dart';
import 'Screens/splashScreen.dart';

void main() async => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Dalton'),
      initialRoute: "/",
      routes: {
        "/": (context) => Vote(),
        "/splash": (context) => SplashScreen(),
        "/settings": (context) => Settings(),
      },
    ));
