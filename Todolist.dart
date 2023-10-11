import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatelessWidget{
  final String name;
  final bool completed;
  Function(bool?)? onchanged;
  Function(BuildContext)? delete;
  Todolist({
    required this.name,
    required this.completed,
    required this.onchanged,
    required this.delete,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane:ActionPane(
          motion: StretchMotion(), //hieu ung keo gian noi dung
          children:[
            SlidableAction(
              onPressed: delete,
              icon:Icons.delete_forever,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(20),),
              
          ]),
        child: Container(
        
        padding:EdgeInsets.all(20) ,
        child:Row(
        children: [
          Checkbox(
            value: completed,
            onChanged: onchanged,
            activeColor: Colors.black,),
            Text(name,style: TextStyle(fontSize: 25,color: Colors.black,
            decoration: completed? TextDecoration.lineThrough:TextDecoration.none),),
        ],
        ) ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.blue.shade300,
        ),
        ),
      ),
    );
  }
  
}