import 'package:app/settings.dart';
import 'package:app/splashScreen.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MaterialApp(
    initialRoute: "/",
    routes: {
        "/": (context) => Home(),
        "/splash": (context) => SplashScreen(),
        "/settings": (context) => Settings(),

    },
));
