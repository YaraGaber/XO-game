
import 'package:flutter/material.dart';
import 'package:xo_game/login.dart';
import 'buttom.dart';

class Home extends StatefulWidget {
  static const String routname='home';
  @override
  State<Home> createState() => _HomeState();


}

class _HomeState extends State<Home> {

  List <String> buttoms = List.filled(9,'');
  int player1Counter =0;
  int player2Counter =0;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as GameArgument;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('X_O game'),
        centerTitle: true,
      )
      ,
      body: Column(
          children: [
            Expanded(
              child: Row(children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${args.player1Name}(X)', style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold)),
                      Text(' $player1Counter', style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold))
                    ],),
                ),
                Expanded(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${args.player2Name}(O)', style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold)),
                        Text('$player2Counter', style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold))
                      ]),
                )
              ],),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Buttom(
                      text: buttoms[0], index: 0, buttomClick: buttomClick),
                  Buttom(text: buttoms[1], index: 1, buttomClick: buttomClick),
                  Buttom(text: buttoms[2], index: 2, buttomClick: buttomClick),
                ],),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Buttom(text: buttoms[3], index: 3, buttomClick: buttomClick),
                Buttom(text: buttoms[4], index: 4, buttomClick: buttomClick),
                Buttom(text: buttoms[5], index: 5, buttomClick: buttomClick),
              ],),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Buttom(text: buttoms[6], index: 6, buttomClick: buttomClick),
                Buttom(text: buttoms[7], index: 7, buttomClick: buttomClick),
                Buttom(text: buttoms[8], index: 8, buttomClick: buttomClick),
              ],),
            ),
          ]),

    );
  }

  int counter =0;

  void  buttomClick(int index){
       if( buttoms[index].isNotEmpty){
           return ;
       }
       if ( counter%2==0){
         buttoms[index] ='X' ;
       }else {
       buttoms[index] ='O' ;
       }
       counter++;
       if(checkWinner('X')){
         player1Counter+=5;
         initalBord();
       }else if (checkWinner('O')){
         player2Counter+=5;
         initalBord();
       }else if (counter==9) {
         initalBord();
       }

       setState(() {

       });
  }
  bool checkWinner(String symbol) {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (buttoms[i] == symbol &&
          buttoms[i + 1] == symbol &&
          buttoms[i + 2] == symbol) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (buttoms[i] == symbol &&
          buttoms[i + 3] == symbol &&
          buttoms[i + 6] == symbol) {
        return true;
      }
    }

    // Check diagonals
    if (buttoms[0] == symbol &&
        buttoms[4] == symbol &&
        buttoms[8] == symbol) {
      return true;
    }

    if (buttoms[2] == symbol &&
        buttoms[4] == symbol &&
        buttoms[6] == symbol) {
      return true;
    }

    // If no winning combination found
    return false;
  }
  initalBord(){
    buttoms = List.filled(9, '');
    counter =0;
    setState(() {

    });
  }


}