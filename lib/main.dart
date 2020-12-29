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
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  //Step1: Create a form with a global key
  var _formKey = GlobalKey<FormState>();
  var _currencies = ['Rupees', "Dollar", "Pound", "Euro", "Others"];
  var _currentItemSelected = '';
  final double _minimumPadding = 5.0;

  void initState(){
     super.initState();
     _currentItemSelected = _currencies[0];
  }

  TextEditingController principleController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding * 3),
        child: ListView(
          children: [

            getImageAsset(),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  style: textStyle,
                  controller: principleController,
                  keyboardType: TextInputType.number,
                  validator: (String value){
                    if(value.isEmpty){
                      return 'Please enter principle amount';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Principle",
                      hintText: "Enter Principle e.g 12000",
                      labelStyle: textStyle,
                      errorStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  style: textStyle,
                  controller: roiController,
                  keyboardType: TextInputType.number,
                  validator: (String value){
                    if(value.isEmpty){
                      return 'Please enter rate of interest';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Rate of Interest",
                      hintText: "In percent",
                      labelStyle: textStyle,
                      errorStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                          style: textStyle,
                          controller: termController,
                          keyboardType: TextInputType.number,
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Please enter term';
                            }
                          },
                          decoration: InputDecoration(
                          labelText: "Term",
                          hintText: "Term in years",
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 15.0
                          ),
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
                            })
                    ),
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
                   setState(() {
                     if(_formKey.currentState.validate()) {
                       this.displayResult = _calculateTotalReturns();
                     }
                   });
                },
              )),

              Expanded(child: RaisedButton(
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).primaryColorLight,
                child: Text("Reset",textScaleFactor: 1.5,),
                onPressed: (){
                  setState(() {
                    _reset();
                  });
                },
              )),

            ],)),

            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text(this.displayResult, style: textStyle,),
             ),

          ],
        ),
      )),
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

  String _calculateTotalReturns(){
     double principle = double.parse(principleController.text);
     double roi = double.parse(roiController.text);
     double term = double.parse(termController.text);

     double totalAmountPayable = principle + (principle * roi * term)/100;
     String result = 'After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected';
     return result;
  }

  void _reset(){
    principleController.text = "";
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentItemSelected = _currencies[0];
  }
}
