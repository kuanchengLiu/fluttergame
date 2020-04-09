class Question {
  String questionText; //問題文字
  String questionAnswer; //問題答案

  Question({String t, String a}) {
    //建構元
    questionText = t;
    questionAnswer = a;
  }
}

class Ans {
  String questAnsA, questAnsB, questAnsC, questAnsD;

  Ans({String a, String b, String c}) {
    questAnsA = a;
    questAnsB = b;
    questAnsC = c;

  }
}
