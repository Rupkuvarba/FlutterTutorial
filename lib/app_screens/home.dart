import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.deepPurple,
        margin: EdgeInsets.only(left:35.0, top:50.0),
        //padding: EdgeInsets.all(10.0),
        child: Text("Flight", textDirection: TextDirection.ltr),
      ),
    );

  }

}