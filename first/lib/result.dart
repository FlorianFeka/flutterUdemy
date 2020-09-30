import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;

  final Function resetQuiz;

  Result(this.score, this.resetQuiz);

  String get resultPhrase {
    return 'Your score: $score';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: resetQuiz,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
