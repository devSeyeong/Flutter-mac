import 'package:flutter/material.dart';

void main() => runApp(SimpleThemeApp());

class SimpleThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleThemeApp',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.purple,
        fontFamily: 'Raleway'),
      darkTheme: ThemeData(
      brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Simple Theme App')),
        body: Center(
          child: Text(
            'this is my custom fonts',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.bold),
            )
          )
        )
      );
  }
}