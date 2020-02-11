import 'package:flutter/material.dart';

class Answer extends StatelessWidget{ 
  final Function selectHandler;
  final String answerTest;

  Answer(this.selectHandler, this.answerTest);
  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      child : RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text(answerTest),
          onPressed: selectHandler,
        ),
    );
  }
}