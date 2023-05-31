import 'package:flutter/material.dart';
import 'package:quiz_app/model/answered_quiz.dart';
import 'package:quiz_app/utils/constant.dart';
import 'dart:math' as math;
import 'package:share_plus/share_plus.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({
    super.key,
    required this.userAnswer,
  });

  final List<AnsweredQuiz> userAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Score"),
        backgroundColor: Constant.primaryColor,
      ),
      backgroundColor: Constant.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: 200.0,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi),
                            child:  CircularProgressIndicator(
                              strokeWidth: 10,
                              value: getCorrentAnswer(),
                              backgroundColor: Colors.red,
                              valueColor:
                                  const AlwaysStoppedAnimation<Color>(Colors.green),
                            ),
                          ),
                        ),
                      ),
                       Center(
                          child: Text(
                        getPercentageText(),
                        style: const TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Share.share('I got correct ${getPercentageText()} Quiz');

                }, child: const Text("Share your score")),
            const Text(
              "Your Report",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount: userAnswer.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userAnswer[index].question,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Row(
                        children: [processAnswer(index)],
                      )
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

 double getCorrentAnswer() {
  return userAnswer.where((element) => (element.userAnswer == element.correctAnswer)).toList().length / userAnswer.length;
}

String getPercentageText() {
  return "${userAnswer.where((element) => (element.userAnswer == element.correctAnswer)).toList().length} / ${userAnswer.length}";
}


  Widget processAnswer(int index) {
    if (userAnswer[index].userAnswer == userAnswer[index].correctAnswer) {
      return Row(
        children: [
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
          Text(
            userAnswer[index].correctAnswer,
            style: const TextStyle(color: Colors.white),
          )
        ],
      );
    } else {
      return Row(
        children: [
          
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
          Text(
            userAnswer[index].userAnswer,
            style: const TextStyle(color: Colors.white),
          ),const Icon(
            Icons.check,
            color: Colors.green,
          ),
          Text(
            userAnswer[index].correctAnswer,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      );
    }
  }
}
