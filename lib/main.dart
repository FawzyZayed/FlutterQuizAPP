import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   final _questions = const [
      {
        'questionText' : 'What is the Italian word for pie ?',
        'answers' : [ 
            {'text': 'Polenta', 'score': 0},
            {'text': 'Pasta', 'score': 0}, 
            {'text': 'Pizza','score': 10}, 
            {'text': 'Borger', 'score': 0},
            {'text': 'Bottarga', 'score': 0},
          ],
      },
      {
        'questionText' : 'What is one quarter of 1,000 ?',
        'answers' : [  
            {'text': '300', 'score': 0}, 
            {'text': '1250', 'score': 0},
            {'text': '250', 'score': 10},
            {'text': '25', 'score': 0},
            {'text': '125','score': 0},
         ],
      },
      {
        'questionText' : 'Name the port of Rome ?',
        'answers' : [ 
            {'text': 'Rome', 'score': 0},
            {'text': 'Ostia', 'score': 10},
            {'text': 'Italy', 'score': 0},
            {'text': 'Florence', 'score': 0},
            {'text': 'Italics','score': 0},
        ],
      },
      {
        'questionText' : 'Which Russian town suffered an infamous nuclear disaster in 1986 ?',
        'answers' : [
          {'text': 'Kazan', 'score': 0},
          {'text': 'Chelyabinsk	','score': 0},
          {'text': 'Moscow', 'score': 0},
          {'text': 'Saint Petersburg', 'score': 0},
          {'text': 'Chernobyl', 'score': 10},
        ],
      },
    ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  void _answerQuestion(int score){
    
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          title: Text('FASAH APP'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
        ),
        body: _questionIndex < _questions.length 
        ? Quiz(
          answerQuestion: _answerQuestion, 
          questionIndex: _questionIndex, 
          questions: _questions
          ) : Result(_totalScore),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add', // used by assistive technologies
          child: Icon(Icons.refresh),
          onPressed: () {
            _resetQuiz();
          },
        ),
      ),
    );
  }
}