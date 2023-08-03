import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp( const MaterialApp(
    home:CalculatorApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class CalculatorApp extends StatefulWidget{


  const CalculatorApp({Key? key}): super(key:key);
  @override
  State<CalculatorApp> createState()=> _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp>{

  var userInput="";
  var input = "";
  var output= "";
  var hideInput=false;
  double outputsize=32.0;

  onButtonPressed(value )
  {
    print(value);

  if (value=="C")
  {
    input="";
    output="";
    }
  else if(value =="⌫") {
   if(input.isNotEmpty){
      input = input.substring(0,input.length-1);}
  }
  else if (value=="="){
    if(input.isNotEmpty){
      userInput= input;
      userInput=input.replaceAll("X" ,"*");
      Parser p= Parser();
      Expression expression =p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalvalue= expression.evaluate(EvaluationType.REAL,cm);
      output= finalvalue.toString();}
      if (output.endsWith(".0")){
        output= output.substring(0, output.length-2);
      }
      input=output;
      hideInput=true;
      outputsize=52;
    }
    else{
      input =input+value;
      hideInput=false;
      outputsize=32.0;
    }
  setState((){});
    
  

  }

  Widget Buttons(String text ,TextColor ,BgColor){
  return Expanded(
    
    child:
    Padding(
      padding: const EdgeInsets.symmetric(horizontal:5.0),
  
      child:ElevatedButton(
        onPressed: ()=>onButtonPressed(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: BgColor,
          shape:CircleBorder(),
          fixedSize: Size(100,100)),
          // padding:EdgeInsets.all(22)
        
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container (
          child:Text(text,
          style:TextStyle(color:TextColor,fontSize:32)
          )),
        )
    
      ),
    )
    );}



  @override

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
      children:[
      Expanded(
        
        child:Container(
          width:double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.black),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  hideInput? " ": input,
                  style: TextStyle(
                  fontSize:50,
                  color:Colors.white,
                ),),
                SizedBox(height: 20,),
                Text(
                  output,
                  style: TextStyle(
                  fontSize:outputsize,
                  color: Colors.white.withOpacity(0.7),
                ),),
                SizedBox(height: 10),
                
              ],
            ),
          ),
        )
        ),
        Row(
          
          children: [
            Buttons("C" ,Colors.white, Color.fromARGB(228, 99, 231, 115)),
            Buttons("()" ,Colors.white, Colors.blue),
            Buttons("%" ,Colors.white, Colors.blue),
            Buttons("/" ,Colors.white, Colors.blue),

          ],),

        Row(
          
          children: [
            Buttons("7" ,Colors.white, Color.fromARGB(115, 93, 87, 87)),
            Buttons("8" ,Colors.white, Color.fromARGB(115, 93, 87, 87)),
            Buttons("9" ,Colors.white, Color.fromARGB(115, 93, 87, 87)),
            Buttons("X" ,Colors.white, Colors.blue),

          ],



        ),

        Row(
          
          children: [
            Buttons("4" ,Colors.white, Color.fromARGB(115, 93, 87, 87)),
            Buttons("5" ,Colors.white, Color.fromARGB(115, 93, 87, 87)),
            Buttons("6" ,Colors.white, Color.fromARGB(115, 93, 87, 87)),
            Buttons("-" ,Colors.white, Colors.blue),

          ],
        ),

         Row(
          
          children: [
            Buttons("1" ,Colors.white, Color.fromARGB(115, 93, 87, 87)),
            Buttons("2" ,Colors.white, Color.fromARGB(115, 93, 87, 87)),
            Buttons("3" ,Colors.white, Color.fromARGB(115, 93, 87, 87)),
            Buttons("+" ,Colors.white, Colors.blue),

          ],
          ),

           Row(
          
          children: [
            Buttons("0" ,Colors.white, Color.fromARGB(115, 93, 87, 87)),
            Buttons("." ,Colors.white, Color.fromARGB(115, 93, 87, 87)),
            Buttons("⌫ " ,Colors.white, Color.fromARGB(115, 93, 87, 87)),
            Buttons("=" ,Colors.white, Colors.blue),

          ],
        ),
        ]

    )

    );
  }
}