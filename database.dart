import 'package:hive_flutter/hive_flutter.dart';

class Tododatabase{
  List todolist =[];

  final _myBox =Hive.box('mybox');
  //chay phuong thuc nay neu lan dau mo app
  void createDatabase(){
     todolist =[["learn english",false],["10h",false]];}
    //tai du lieu tu database
  
  void loadData(){
     todolist = _myBox.get("TODOLIST"); 
    }
  // cap nhat du lieu
  void updateData(){
    _myBox.put("TODOLIST",todolist);
  }
}