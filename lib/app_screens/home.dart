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
            //Column-1
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Flight",
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
                  "Flight1 which is coming from banglore",
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
                  "Vegetable",
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
                  "Vegetables grows in land. It will help us alot",
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
            GoogleImageAsset()

          ],
        ),
      ),
    );
  }
}

class GoogleImageAsset extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('images/btn_google.png');
    Image image = Image(image: assetImage, width: 250.0, height: 250.0,);
    return Container(child: image,);
  }

}
