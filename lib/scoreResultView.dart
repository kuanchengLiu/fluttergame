import 'package:flutter/material.dart';

class ScoreResultView extends StatelessWidget {
  int scores = 0;
  ScoreResultView(int score) {
    scores = score;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'your final point: \n' + scores.toString() + '\r\n答對題數 \r\n' + scores.toString()+'/2',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 70.0,
                    color: Colors.yellow,
                    fontFamily: "berkshireSwash"),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
