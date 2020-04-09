import 'package:flutter/material.dart';
import 'package:homeworktwo/quizeController.dart';

class Quize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizController(),
          
        ),
      ),
    );
  }
}
