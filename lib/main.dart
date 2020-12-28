import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Simple Interest calculator app",
    home: SIForm(),
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Principle",
                      hintText: "Enter Principle e.g 12000",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Rate of Interest",
                      hintText: "In percent",
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Term",
                          hintText: "Term in years",
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
                child: Text("Calculate"),
                onPressed: (){

                },
              )),

              Expanded(child: RaisedButton(
                child: Text("Reset"),
                onPressed: (){

                },
              )),

            ],)),

            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text("Todo Text"),
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
