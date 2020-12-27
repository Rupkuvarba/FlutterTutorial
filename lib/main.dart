import 'package:flutter/material.dart';
import 'package:flutter_app_tutorial/app_screens/home.dart';

void main(){
  runApp(MaterialApp(

    title: "Exploring UI widgets",

    home: Scaffold(

      appBar: AppBar(title: Text("Basic ListView"),),
      body: getLongListView(),  //Long ListView
      //body: getListView(),    //Basic listView
    ),

  ));
}

/*
Long List
 */

//1.prepare the data source

List<String> getListElements(){
  var items = List<String>.generate(100, (index) => "Item $index");
  return items;
}

//2. Convert data source into widgets
Widget getLongListView(){

  var listItems = getListElements();

  var listView = ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (context, index){
        return ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text(listItems[index]),
          onTap: (){
            debugPrint("${listItems[index]} was tapped");
          },
        );
      }
      );

  return listView;
}

/*
Basic listView
 */

Widget getListView(){

  var listView = ListView(
    children: <Widget>[

      ListTile(
        leading: Icon(Icons.landscape),
        title: Text("Landscape"),
        subtitle: Text("Beautiful view"),
        trailing: Icon(Icons.wb_sunny),
        onTap: (){
          debugPrint("Landscape tapped");
        },
      ),

      ListTile(
        leading: Icon(Icons.laptop_chromebook),
        title: Text("Mac"),
        trailing: Icon(Icons.wb_cloudy),
      ),

      ListTile(
        leading: Icon(Icons.phone),
        title: Text("Phone"),
      ),

      ListTile(
        title: Text("Only title"),
      ),

      Container(
        child: Text("Yet another element in list",),
        margin: EdgeInsets.all(10.0),
      ),

      Container(margin: EdgeInsets.all(10.0), color: Colors.red, height: 30,),

    ],
  );

  return listView;
}

