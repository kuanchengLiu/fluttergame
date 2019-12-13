import 'package:flutter/material.dart';
import 'package:homeworktwo/scoreResultView.dart';

class ScoreResult extends StatelessWidget {
  int FinalScore;
  ScoreResult(int score) {
    FinalScore = score;
  }
  static const String _title = 'Final Score';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          
          child: ScoreResultView(FinalScore),
        ),
      ),
    );
    
  }
}
