
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tutorial/app_screens/note_list.dart';

void main(){
  //runApp(MyApp());
  print('main programm starts');
  printFileContent();
  print('main programm ends');
}

printFileContent(){
  Future<String> fileContent = downLoadAFile();
  fileContent.then((resultValue) => print('The content of the file is resultValue --> $resultValue'));
  //print('the content of the file is --> $fileContent');
}

//To download a file [Dummy long running operation]
Future<String> downLoadAFile(){

  Future<String> result = Future.delayed(Duration(seconds: 6), () {
    return 'My secret file content';
  });

  return result;
}