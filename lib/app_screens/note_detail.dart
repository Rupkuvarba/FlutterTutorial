
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget{

  String appBarTitle = '';

  NoteDetail(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.appBarTitle);
  }

}

class NoteDetailState extends State<NoteDetail>{

  String appBarTitle = '';
  var _priorities = ['High', 'Low'];
  String _selectedPriorities = '';

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedPriorities = _priorities[1];
  }

  NoteDetailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    return WillPopScope(

      onWillPop: (){
        //Write some code to control things, when user press back press navigation button in device
        moveToLastScreen();
      },

      child: Scaffold(

      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: (){
            //Write some code to control things, when user press back press navigation button in appBar
            moveToLastScreen();
          },
        ),
      ),

      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
        child: ListView(
          children: [

            //First element
            ListTile(
              title: DropdownButton(
                items: _priorities.map((dropDownStringItem)
                => DropdownMenuItem(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem))).toList(),

                style: textStyle,

                value: _selectedPriorities,

                onChanged: (value){
                  setState(() {
                     _selectedPriorities = value;
                  });
                },
              ),
            ),

            //Second Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value){
                  debugPrint('something changed on title text field');
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )
                ),
              ),
            ),

            //Third Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value){
                  debugPrint('something changed on description text field');
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                ),
              ),
            ),

            //Fourth Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(

                children: [

                  //Expanded for equal space
                  Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: (){
                          setState(() {
                            debugPrint('Save button clicked');
                          });
                        },
                      ),
                  ),

                  Container(width: 5.0,),

                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Delete',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: (){
                        setState(() {
                          debugPrint('Delete button clicked');
                        });
                      },
                    ),
                  ),

                ],

              ),
            ),

          ],
        ),
      ),
  ));
  }

  void moveToLastScreen(){
    Navigator.pop(context);
  }

}