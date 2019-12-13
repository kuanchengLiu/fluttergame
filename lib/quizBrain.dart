import 'package:homeworktwo/question.dart';

class QuizBrain {
  List<Question> _questions = [
    Question(t: '動漫界有一成句：「說好不提____的…」，其來自________', a: 'A'),
    Question(t: '動漫界中常見「黑歷史」一詞，其解釋為？', a: 'C'),
    Question(t: '「ACG」的解釋為？', a: 'C'),
    Question(t: '你什麼時候產生這一題存在的幻覺了', a: 'A'),
    Question(t: '火影忍者中，漩渦鳴人(又譯渦巻鳴人)曾說過：「我一向_______，這就是我的忍道」，空格中應填入？', a: 'D'),
    Question(t: 'this is the end of the game', a: 'A'),
  ];
  List<Ans> _ans = [
    Ans(a: '大復活，火影忍者', b: '動畫版，真月譚月姬', c: '261，HUNTERxHUNTER', d: '夢結局，魔法美少女'),
    Ans(a: '故事主角常有的悲慘', b: '故事中尚未有文字的史前', c: '不願回想的東西', d: '被隱藏於和平表面下的秘密'),
    Ans(
        a: '很A的CG',
        b: 'A complete game',
        c: 'Animation，Comic，Game',
        d: 'Airs Center of Gravity'),
    Ans(a: '中鏡花水月時', b: '中幻術時', c: '被癡漢推倒時', d: '被手錶麻醉槍射中時'),
    Ans(a: '正面突破', b: '都來陰的', c: '只交白卷', d: '有話直說'),
    Ans(a: 'over', b: '', c: '', d: ''),
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

  String getAnsD(int position) {
    return _ans[position].questAnsD;
  }
}
