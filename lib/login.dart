import 'package:flutter/material.dart';
import 'package:xo_game/home.dart';

class Login  extends StatelessWidget{
  static const String routname='login';
  String player1Name='';
  String player2Name='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('X_O game'),
      centerTitle: true),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (text){
              player1Name =text;
            }
            ,decoration: InputDecoration(
            labelText: 'player1',
          ),),
        ),
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField( onChanged: (text){
            player2Name =text;
          },decoration: InputDecoration(
            labelText: 'player2',
          ),),
        ), SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: (){
            Navigator.of(context).pushNamed(Home.routname,
                arguments: GameArgument
                  (player1Name: player1Name, player2Name: player2Name));
          }, child: Text("let's play")),
        ),
      ]),
    );
  }

}
class GameArgument{
  String  player1Name ;
  String  player2Name ;
  GameArgument({required this.player1Name, required this.player2Name});
}