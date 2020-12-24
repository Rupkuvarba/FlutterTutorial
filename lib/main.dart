import 'package:flutter/material.dart';
import 'package:flutter_app_tutorial/app_screens/first_screen.dart';

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
          body: FirstScreen()
        )
    );

  }

}