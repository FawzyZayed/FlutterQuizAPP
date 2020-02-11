import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int resultScore; 
  Result (this.resultScore);
  String get resultPharse {
    var resultText;

    if (resultScore <= 10 ) { 
      resultText =  'Your are blala Land itself';
    } else if (resultScore  <= 30){
      resultText =  'Good But need More ';
    } else {
      resultText =  'You are Awosome ';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child :Text(
        resultPharse,
        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
      ),
    );
  }
}