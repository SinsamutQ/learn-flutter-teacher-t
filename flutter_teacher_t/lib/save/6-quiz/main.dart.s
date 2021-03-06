import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [
    Icon(Icons.check, color: Colors.green),
    Icon(Icons.close, color: Colors.red),
  ];

  //Expected a class member.Try placing this code inside a class member.dart

  // if (userPickedAnswer == questionBank[questionNumber].questionAnswer) {
  //   print('correct');
  //   scoreKeeper.add(Icon(Icons.check, color: Colors.green));
  // }

  int questionNumber = 0;

  List<Question> qBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs.' , a: false ),
    Question(q: 'Approximately one quarter of human bones are in the feet.', a: true),
    Question(q: 'A slug\'s blood is green.' , a: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                qBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAns = qBank[questionNumber].questionAnswer;
                if (correctAns == true) {
                  print('correct!');
                } else {
                  print('wrong!');
                }
                //The user picked true.
                setState(() {
                  questionNumber = (questionNumber + 1) % qBank.length;
                });
              },
            ),
          ),
        ),
        
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAns = qBank[questionNumber].questionAnswer;
                if (correctAns == false) {
                  print('correct!');
                } else {
                  print('wrong!');
                }
                //The user picked false.
                setState(() {
                  questionNumber = (questionNumber + 1) % qBank.length;
                });

                  AlertDialog alert = AlertDialog(
                    title: Text('Finished'),
                    content: Text('You\'ve reached the end of the quiz'),
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed: (){
                          Navigator.pop(context, 'OK');
                        },
                      ),
                      TextButton(
                        child: Text('OK'),
                        onPressed: (){
                          Navigator.pop(context, 'OK');
                        },
                      )
                    ],
                  );

                  // show the dialog
                  showDialog(
                    context: context, 
                    builder: (BuildContext context) {
                      return alert;
                    },
                  ); 

              },
            ),
          ),
        ),
        
        //TODO: Add a Row here as your score keeper

        Row(
        children: scoreKeeper,
        )

    ],
        
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
