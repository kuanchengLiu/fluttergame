import 'package:flutter/material.dart';
import 'package:homeworktwo/quizBrain.dart';
import 'package:homeworktwo/quizeController.dart';
import 'package:homeworktwo/scoreResult.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

var questionNumber = 0;
int score = 0; //測驗成績

class QuizeView extends State<QuizController> {
  @override
  Widget build(BuildContext context) {
    List<Icon> scoreKeeper = [];

    QuizBrain qb = QuizBrain();

    void checkAnswer(String userAnswer) {
      if (questionNumber < 2) {
        if (userAnswer == qb.getQuestionAnswer(questionNumber)) {
          //答對了
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          score++;
          print(qb.getQuestionAnswerString(questionNumber));
          rightAlert(context, qb.getQuestionAnswerString(questionNumber));
          print(qb.getQuestionText(questionNumber));
        } else {
          //答錯了
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          wrongAlert(context, qb.getQuestionAnswerString(questionNumber));
        }
      } else {
        questionNumber = 0;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ScoreResult(score)));
        return;
      }
      if (questionNumber == 2)
        qb.setQuestionText(questionNumber + 1, '測驗已完成，您的成績為$score分 答對$score/2');

      questionNumber += 1;
      print(questionNumber);
    }

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          //問題區
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                qb.getQuestionText(questionNumber),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          //問題區
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(bottom: 100.0),
            child: Center(
              child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 100.0,
                  backgroundImage: AssetImage('images/quiz.png')),
            ),
          ),
        ),
        Row(children: <Widget>[
          Expanded(
            //A區
            flex: 1,
            // child: Padding(
            //   padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'A:\r\n ' + qb.getAnsA(questionNumber),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer('A');
                });
              },
            ),
            //),
          ),
          Expanded(
            //B區
            flex: 1,
            // child: Padding(
            //   padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'B: \r\n' + qb.getAnsB(questionNumber),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer('B');
                });
              },
            ),
            //),
          ),
        ]),
        Row(children: <Widget>[
          Expanded(
            //C區
            // child: Padding(
            //   padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text(
                '\r\nC: ' + qb.getAnsC(questionNumber),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer('C');
                });
              },
            ),
            //),
          ),
        ]),
        Row(
          children: scoreKeeper, //必須為Widget型別內容的List
        ),
      ],
    ));
  }

  rightAlert(contextcontext, String ans) {
    // Reusable alert style
    QuizBrain qb = QuizBrain();
    print(qb.getQuestionAnswerString(questionNumber));
    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 700),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
    );
    Alert(
      image: qb.getQuestionAnswerString(questionNumber) == '虎\r\n'
          ? Image.asset('images/tiger.jpg')
          : Image.asset('images/sugar.jpg'),
      context: context,
      // style: alertStyle,
      // type: AlertType.info,
      title: "答對了!",
      desc: ans,
      buttons: [
        DialogButton(
          child: Text(
            "繼續下一題",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.blue,
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  wrongAlert(context, String ans) {
    // Reusable alert style
    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 700),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
    );
    // Alert dialog using custom alert style
    Alert(
      context: context,
      // style: alertStyle,
      // type: AlertType.info,

      title: "答錯了!",
      desc: "加油，好嗎？！",
      image: Image.asset('images/quiz.png'),
      buttons: [
        DialogButton(
          child: Text(
            "繼續下一題",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.blue,
          radius: BorderRadius.circular(10.0),
        ),
      ],
    ).show();
  }
}
