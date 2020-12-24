import 'package:flutter/material.dart';

void main() => runApp(new MyFlutterApp());

class MyFlutterApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      debugShowCheckedModeBanner: false,  //Remove debug tag
        title: "My Flutter App",
        home: Scaffold(
          appBar: AppBar(title: Text("My First App Screen"),),
          body: Material(
            color: Colors.orangeAccent,
            child: Center(
              child: Text(
                "Hello Flutter",
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
          ),
        )
    );

  }

}