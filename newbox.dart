import 'package:flutter/material.dart';
import 'package:flutter_application_1/Mybutton.dart';

class newbox extends StatelessWidget{
  final controller;
  VoidCallback save;
  VoidCallback cancel;
  newbox({required this.controller,required this.save,required this.cancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height:120 ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "new task",
              ),
            ),
            // buton save vs cancel
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Mybutton(
                name: "SAVE",
                onPressed: save),
                Mybutton(
                name: "CANCEL",
                onPressed: cancel),

            ],
           )
          ],
        ),
      ),
    );
  }

}