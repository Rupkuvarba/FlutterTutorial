import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        padding:
            EdgeInsets.only(left: 10.0, top: 50.0, right: 10.0, bottom: 50.0),
        alignment: Alignment.center,
        color: Colors.deepPurple,

        //column
        child: Column(
          children: [
            //-1
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Android Developer",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 35.0,
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                )),
                Expanded(
                    child: Text(
                  "Create android app in native. He can create app using java/kotlin programming language,",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ))
              ],
            ),

            //column 2
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Flutter Developer",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 35.0,
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                )),
                Expanded(
                    child: Text(
                  "Create Android and iOS app using flutter. She can crate app using Dart programming language",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ))
              ],
            ),

            //Column3
            GoogleImageAsset(),

            FlightBookButton()
          ],
        ),
      ),
    );
  }
}

class GoogleImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('images/btn_google.png');
    Image image = Image(
      image: assetImage,
      width: 150.0,
      height: 150.0,
    );
    return Container(
      child: image,
    );
  }
}

class FlightBookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 300.0,
      height: 80.0,
      margin: EdgeInsets.only(top: 30.0),
      child: RaisedButton(
          color: Colors.orangeAccent,
          child: Text(
            "Book developer",
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: "DMSans",
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          elevation: 6.0,
          onPressed: () => bookDeveloper(context)),
    );
  }

  void bookDeveloper(BuildContext context) {
    //Create dialog
    var alertDialog = AlertDialog(
      title: Text("Developer booking successfully"),
      content: Text("Have a good day!"),
    );

    //Show dialog
    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}
