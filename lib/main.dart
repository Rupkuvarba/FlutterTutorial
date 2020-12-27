import 'package:flutter/material.dart';

void main(){

  runApp(
    MaterialApp(
      title: "Stateful App Example",
      home: FavouriteCity(),
    )
  );

}

//Step1: Create the class that extends stateful widget, that returns a state in "CreateState()"
class FavouriteCity extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return _FavouriteCityState();
  }

}

//Step2:  create a state class, with properties that may change
class _FavouriteCityState extends State<FavouriteCity>{

  String nameOfCity = "";

  //Step3: Within “State” class, implement the “build()” method
  @override
  Widget build(BuildContext context) {
     return Scaffold(

       appBar: AppBar(
         title: Text("Stateful Exmple"),
       ),
       body: Container(
         margin: EdgeInsets.all(15.0),
         child: Column(
           children: <Widget>[

             TextField(
               onSubmitted: (String userInput){
                 //Step4: Call the setState() to make the changes. Calling setState() tells framework to redraw widget
                 setState(() {
                   nameOfCity = userInput;
                 });
               },
             ),

             Padding(
               padding: EdgeInsets.all(20.0),
               child: Text(
                 "Your best city is $nameOfCity",
                 style: TextStyle(fontSize: 15.0),),
             )
             
           ],
         ),
       ),
     );
  }

}