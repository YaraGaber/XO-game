import 'package:flutter/material.dart';

class Buttom extends StatelessWidget{
  String text ;
  int  index ;
 Function buttomClick;
  Buttom({required this.text, required this.index, required this.buttomClick});
  @override
  Widget build(BuildContext context) {
   return  Expanded(
       child: Container(
         margin: EdgeInsets.all(3),
         child: ElevatedButton(onPressed:(){
           buttomClick(index);
         },
          child: Text(text,
            style: TextStyle(fontSize: 30),

          ),),
       )
   );
  }

}