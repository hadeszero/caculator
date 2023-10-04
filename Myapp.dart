
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Button.dart';
import 'package:math_expressions/math_expressions.dart';
class Myapp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Myapp();
  }
}
class _Myapp extends State<Myapp>{
  //ham tinh toan bieu thuc
  void result(){
  if(question.isEmpty){
    question='';
    answer='';}
  else{
  String input =question;
  input=input.replaceAll('x', '*');
  Parser p  =Parser();
  Expression exp =p.parse(input);
  ContextModel cm =ContextModel();
  double eval =exp.evaluate(EvaluationType.REAL, cm);
  // question=eval.toString();
  question='';
  answer =eval.toString();
  } }
  var question ='';
  var answer  ='';
 
  List<String> Buttons =['clear','Del','%','/',
                          '9','8','7','x',
                          '6','5','4','-',
                          '3','2','1','+',
                          '0','.','ans','='];
  
                          
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: GestureDetector(
    
      child: Container(
        
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image1.jpg'),
            fit: BoxFit.fill)
        ),
       
        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(question,style: TextStyle(fontSize: 30,color: Colors.black),)),
                  
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(answer,style: TextStyle(fontSize: 30),)),                 
                ],
              ),
            )),
          Expanded(
            
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 10), 
              decoration: BoxDecoration(         
               borderRadius: BorderRadius.circular(20),         
              ),
              
              child: GridView.builder(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,       // so luong cot
                mainAxisSpacing: 5.0,    // khoang cach giua cac hang
                crossAxisSpacing: 5.0,   //khoang cach giua cac cot
                childAspectRatio: 1, //chieu cao gap may lan lan chieu rong
                ), 
                
                itemCount: Buttons.length,
                itemBuilder:(context, index) {
                 if (Buttons[index]=='clear'){
                  return Button(
                    buttontap: (){
                      setState(() {
                       
                        question = '';
                        answer='';
                      });
                    },
                    name: Buttons[index],
                    color: Colors.green.withOpacity(0.2));
                 }else if(Buttons[index]=='Del'){
                  return Button(
                    buttontap: (){
                      setState(() {
                      
                        question=question.substring(0,question.length-1);
                       
                      });
                      // result();
                    },
                    name: Buttons[index],
                    color:Colors.red.withOpacity(0.2));
                 }else if(Buttons[index]=='ans'){
                  return Button(
                    name: Buttons[index], 
                    color: Colors.blue.withOpacity(0.2),
                    buttontap: () {
                      setState(() {
                        
                        question=answer;
                      });
                    },);
                 }
                 else if(Buttons[index]=='='){
                  return Button(
                    name: Buttons[index], 
                    color: Colors.pink.withOpacity(0.2), 
                    buttontap: (){
                      setState(() {
                        result();
                      });
                    });
                 }
                 else{
                  return Button( 
                    buttontap: (){
                      setState(() {
                         question+=Buttons[index];
                      });
                    },
                    name: Buttons[index], 
                    color: Colors.white.withOpacity(0.1));}
              
                },
                ),
            ))
          
        ],),
      ),
    ),
   );
  
  }
}