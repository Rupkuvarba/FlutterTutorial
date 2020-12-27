import 'package:flutter/material.dart';
import 'package:flutter_app_tutorial/app_screens/home.dart';

void main(){
  runApp(MaterialApp(
    title: "Exploring UI widgets",
    home: Scaffold(
      appBar: AppBar(title: Text("Basic ListView"),),
      body: getListview(),
    ),
  ));
}

Widget getListview(){

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
/*import 'package:flutter_app_tutorial/app_screens/first_screen.dart';

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

}*/
