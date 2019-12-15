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
      if (questionNumber < 5) {
        if (userAnswer == qb.getQuestionAnswer(questionNumber)) {
          //答對了
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          score++;
          rightAlert(context);
          print(qb.getQuestionText(questionNumber));
        } else {
          //答錯了
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          wrongAlert(context);
        }
      } else {
        questionNumber = 0;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ScoreResult(score)));
        return;
      }
      if (questionNumber == 4)
        qb.setQuestionText(questionNumber + 1, '測驗已完成，您的成績為$score分');

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
          flex: 5,
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
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                '分數：' + score.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Row(children: <Widget>[
          Expanded(
            //A區
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 10,
                right: 5,
                bottom: 20,
              ),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
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
            ),
          ),
          Expanded(
            //B區
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 10,
                right: 5,
                bottom: 20,
              ),
              child: FlatButton(
                color: Colors.red,
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
            ),
          ),
        ]),
        Row(children: <Widget>[
          Expanded(
            //C區
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 1,
                right: 5,
                bottom: 20,
              ),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'C: ' + qb.getAnsC(questionNumber),
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
            ),
          ),
          Expanded(
            //D區
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 10,
                right: 5,
                bottom: 20,
              ),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'D: ' + qb.getAnsD(questionNumber),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    checkAnswer('D');
                  });
                },
              ),
            ),
          ),
        ]),
        Row(
          children: scoreKeeper, //必須為Widget型別內容的List
        ),
      ],
    ));
  }

  rightAlert(context) {
    // Reusable alert style
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
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: "答對了!",
      desc: "不錯喔，請繼續保持下去！",
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

  wrongAlert(context) {
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
      style: alertStyle,
      type: AlertType.info,
      title: "答錯了!",
      desc: "加油，好嗎？！",
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
