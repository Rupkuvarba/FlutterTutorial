import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Interest calculator app",
    home: SIForm(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      accentColor: Colors.indigoAccent,
    ),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIForm();
  }
}

class _SIForm extends State<SIForm> {
  var _currencies = ["Rupees", "Dollar", "Pound", "Euro", "Others"];
  var _currentItemSelected = "Rupees";
  final _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 3),

        child: ListView(
          children: [

            getImageAsset(),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  style: textStyle,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Principle",
                      hintText: "Enter Principle e.g 12000",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  style: textStyle,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Rate of Interest",
                      hintText: "In percent",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          style: textStyle,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                          labelText: "Term",
                          hintText: "Term in years",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                        child: DropdownButton(
                            items: _currencies
                                .map((value) => DropdownMenuItem(
                                      child: Text(value),
                                      value: value,
                                    ))
                                .toList(),
                            value: _currentItemSelected,
                            onChanged: (String newSelectedValue) {
                              onDropDownItemSelected(newSelectedValue);
                            })),
                  ],
                )),

            Padding(
              padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child : Row(children: [

              Expanded(child: RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Theme.of(context).primaryColorDark,
                child: Text("Calculate", textScaleFactor: 1.5,),
                onPressed: (){

                },
              )),

              Expanded(child: RaisedButton(
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).primaryColorLight,
                child: Text("Reset",textScaleFactor: 1.5,),
                onPressed: (){

                },
              )),

            ],)),

            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text("Todo Text", style: textStyle,),
             ),

          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage("images/money.png");
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );
    return Container(
      child: image,
      padding: EdgeInsets.all(_minimumPadding * 5),
    );
  }

  void onDropDownItemSelected(String newSelectedValue) {
    setState(() {
      _currentItemSelected = newSelectedValue;
    });
  }

}
