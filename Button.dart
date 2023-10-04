import 'package:flutter/material.dart';
class Button extends StatefulWidget{
  String name;
  Color color;
  final VoidCallback buttontap;
  // ham khoi tao
  Button({required this.name,required this.color,required this.buttontap});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool press =false;
  
 
  
  void _onTapDown(TapDownDetails details){
    setState(() {
      press =true;
    });
  }
  void _onTapUP(TapUpDetails details){
    setState(() {
      press=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.buttontap ,
      onTapDown: _onTapDown ,
      onTapUp: _onTapUP,
      child: Container(
      margin:EdgeInsets.only(left: 5,top: 10,right: 5) ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.color,
        boxShadow:!press ? null : [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            blurRadius: 1
          ),
          BoxShadow(
            color:Colors.white,
            spreadRadius: 2,
            blurRadius: 5,
          )
        ]
      ),
      child: Center(child: Text(widget.name,style: TextStyle(fontSize: 30,color: Colors.black),)),
      ),
    );
  }
}