import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: Text(
          "NTI MATAPP",
        ),
      ),
      /////////////////
      ////////////////

      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                /* Text(
                  'matapp',
                  style: TextStyle(fontSize: 25, color: Colors.deepPurple[900]),
                ), */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.all(1.0),
                      icon: Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.green[700],
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      padding: EdgeInsets.all(1.0),
                      icon: Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.lime[700],
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      padding: EdgeInsets.all(1.0),
                      icon: Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.deepOrange[400],
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      padding: EdgeInsets.all(1.0),
                      icon: Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red[800],
                        size: 50,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Informerat personal?",
                  style: TextStyle(fontSize: 25, color: Colors.grey[800]),
                ),
                Text(
                  "Anledning",
                  style: TextStyle(fontSize: 25, color: Colors.grey[800]),
                ),
                new RaisedButton(
                  color: Colors.indigo[800],
                  child: Text(
                    'Skicka in',
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
