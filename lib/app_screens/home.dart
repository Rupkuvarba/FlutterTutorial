import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.deepPurple,
        child: Text(
          "Flight",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 75.0,
              fontFamily: "DMSans",
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: Colors.white
          ) ,
        ),
      ),
    );

  }

}