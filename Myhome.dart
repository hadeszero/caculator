
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Todolist.dart';
import 'package:flutter_application_1/database.dart';
import 'package:flutter_application_1/newbox.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Myhome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Myhome();
  }
}

class _Myhome extends State<Myhome>{
// refence  the hive box
 final _myBox = Hive.box('mybox');
 Tododatabase db= Tododatabase();

 @override
  void initState(){
    // mo lan dau
    if(_myBox.get("TODOLIST")==null){
      db.createDatabase();
    }else{
      db.loadData();
    }
  super.initState();
 }

  // ham check
  void check(bool? value,int index){
    setState(() {
      db.todolist[index][1]=!db.todolist[index][1];
    });
    db.updateData();
  }
  //lay thong tin khi nguoi dung nhap va bam nut save
  final _controller =TextEditingController();
  //toa them new
  void newtask(){
  showDialog
  (context: context,
   builder: (context){
    return newbox(
      controller: _controller, 
      save:onsave,
      cancel: () => Navigator.of(context).pop(),//dong hop thoai hien tai nhap lieu
      ); 
   });
  }
  //  ham luu du lieu
   void  onsave(){
    setState(() {
      db.todolist.add([_controller.text,false]);
      Navigator.of(context).pop();
    });  }
    // ham xoa
    void delete(int index){
      setState(() {
        db.todolist.removeAt(index);
      });
      db.updateData();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: newtask,
        child: Icon(Icons.add,color:Colors.pink.shade300,),),
      backgroundColor: Colors.yellow.shade300,
      appBar: AppBar(
      backgroundColor: Colors.yellow,
      title: Center(child: Text('TO DO',style: TextStyle(fontSize: 30,color: Colors.black),)),
      elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder:(context, index) {
          return Todolist(
            name: db.todolist[index][0],
            completed:db.todolist[index][1],
            onchanged: (value) =>check(value, index), 
            delete: (context) =>delete(index) ,);
        },)
        
    );
  }

}