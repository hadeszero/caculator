import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget{
  String name;
  VoidCallback onPressed;

  // ham tao
  Mybutton({required this.name,required this.onPressed});
  @override
  Widget build(BuildContext context) {
   return MaterialButton(
    child: Text(name),
    onPressed: onPressed,
    color: Colors.white,
    );
  }
}