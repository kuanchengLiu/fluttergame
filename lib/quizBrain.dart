import 'package:flutter/material.dart';
import 'package:homeworktwo/question.dart';

class QuizBrain {
  List<Question> _questions = [
    Question(t: '十二生肖中的第三個動物是什麼？', a: 'C'),
    Question(t: '下列何者不是三杯雞裡的三杯紙的原料？', a: 'A'),
    Question(t: '', a: 'C')
  ];
  List<Ans> _ans = [
    Ans(a: '龍\r\n', b: '鼠\r\n', c: '虎\r\n'),
    Ans(a: '糖\r\n', b: '麻油\r\n', c: '醬油\r\n'),
    Ans(a: 'exit\r\n', b: 'exit\r\n ', c: 'exit\r\n ')
  ];

  void setQuestionText(int position, String questionText) {
    _questions[position].questionText = questionText;
  }

  String getQuestionText(int position) {
    return _questions[position].questionText;
  }

  String getQuestionAnswer(int position) {
    return _questions[position].questionAnswer;
  }

  String getAnsA(int position) {
    return _ans[position].questAnsA;
  }

  String getAnsB(int position) {
    return _ans[position].questAnsB;
  }

  String getAnsC(int position) {
    return _ans[position].questAnsC;
  }

  String getQuestionAnswerString(int position) {
    if (_questions[position].questionAnswer == 'A')
      return getAnsA(position);
    else if (_questions[position].questionAnswer == 'B')
      return getAnsB(position);
    else
      return getAnsC(position);
  }
}
