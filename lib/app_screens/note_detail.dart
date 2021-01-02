import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tutorial/models/note.dart';
import 'package:flutter_app_tutorial/utils/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget{

  String appBarTitle = '';
  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }

}

class NoteDetailState extends State<NoteDetail>{

  String appBarTitle = '';
  var _priorities = ['High', 'Low'];

  var _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();
  Note note;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  NoteDetailState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    titleController.text = note.title;
    descriptionController.text = note.description;

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

      body: Form(
          key: _formKey,
          child: Padding(
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

                  value: getPriorityAsString(note.priority),

                  onChanged: (valueSelectedByUser){
                    setState(() {
                       updatePriorityAsInt(valueSelectedByUser);
                    });
                  },
                ),
              ),

              //Second Element
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextFormField(
                  controller: titleController,
                  style: textStyle,
                  validator: (String value){
                    if(value.isEmpty){
                    return 'Please enter title';
                    }
                  },
                  onChanged: (value){
                    debugPrint('something changed on title text field');
                    updateTitle();
                  },
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                  ),
                ),
              ),

              //Third Element
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextFormField(
                  controller: descriptionController,
                  style: textStyle,
                  validator: (String value){
                    if(value.isEmpty){
                      return 'Please enter description';
                    }
                  },
                  onChanged: (value){
                    debugPrint('something changed on description text field');
                    updateDescription();
                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: textStyle,
                      errorStyle: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15.0,
                      ),
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
                              if(_formKey.currentState.validate()) {
                                 //_save();
                              }
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
                            _delete();
                          });
                        },
                      ),
                    ),

                  ],

                ),
              ),

            ],
          ),
        )),
   ));
  }

  void moveToLastScreen(){
    Navigator.pop(context, true);
  }

  //Convert string priority in the form of integer before saving it to Database
  void updatePriorityAsInt(String value){
    switch(value){
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
  }

  //Convert int priority to string priority and display it to user in dropdown
  String getPriorityAsString(int value){
    String priority;
    switch(value){
      case 1:
        priority = _priorities[0];  //High
        break;
      case 2:
        priority = _priorities[1];   //Low
        break;
      default:
        priority = _priorities[0];
        break;
    }
    return priority;
  }

  //Update the title of Note object
  void updateTitle(){
    note.title = titleController.text;
  }

  //Update the description of Note object
  void updateDescription(){
    note.description =descriptionController.text;
  }

  void _save() async{
    moveToLastScreen();

    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if(note.id != null){
       result = await databaseHelper.updateNote(note);
    }else{
      result = await databaseHelper.insertNote(note);
    }

    if(result != 0){  //Success
      _showAlertDialog('Status', 'Note Saved Successfully');
    }else{   //Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }
  }

  void _delete() async{
    //Back to screen
    moveToLastScreen();

    //Case 1: If user is trying to delete the NEW NOTE i.e.he has come to
    // the detail page by pressing the FAB of NoteList page
    if(note.id == null){
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }

    //Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await databaseHelper.deleteNote(note.id);
    if(result != 0){  //Success
      _showAlertDialog('Status', 'Note Deleted Successfully');
    }else{   //Failure
      _showAlertDialog('Status', 'Error Occurred while Deleting Note');
    }
  }

  void _showAlertDialog(String title, String message){
    var alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );

    //Show dialog
    showDialog(context: context, builder: (BuildContext context) => alertDialog);
  }

}