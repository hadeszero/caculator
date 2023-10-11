import 'package:flutter/material.dart';
import 'package:flutter_application_1/Myhome.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async{
  //init  the hive
  await Hive.initFlutter(); 
  // open a box
  var box = await Hive.openBox('mybox'); 
  runApp(MaterialApp(
    home:SafeArea(
      child: Myhome()),
  ));
}
