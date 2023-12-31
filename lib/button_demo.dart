import 'package:flutter/material.dart';

void main() => runApp(ButtonDemo());

class ButtonDemo extends StatefulWidget {
  @override
  State createState() => ButtonDemoState();
}

class ButtonDemoState extends State<ButtonDemo> {
  static const String _title = "Button 위젯 데모";
  String _buttonState = "OFF";

  void onClick() {
    print ('onClick()');
    setState(() {
      if(_buttonState == "OFF"){
        _buttonState = "ON";
      } else {
        _buttonState = "OFF";
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: onClick, child: Text('사각 버튼')),
            Text('$_buttonState'),
            ElevatedButton(onPressed: onClick, child: Text('둥근 버튼'), style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))),)
          ],
        )
      )
    );
  }
}