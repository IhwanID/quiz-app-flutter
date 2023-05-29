import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/model/answered_quiz.dart';
import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/score_page.dart';
import 'package:quiz_app/utils/constant.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Quiz> quizList = [
    Quiz(
        question: "How are you?",
        choices: ["fine", "okey", "not bad", "not good"],
        image: "https://picsum.photos/250?image=9",
        answer: "fine"),
    Quiz(
        question: "Who is current presiden of Indonesia?",
        choices: ["fine", "okey", "not bad", "not good"],
        image: "https://picsum.photos/250?image=8",
        answer: "fine"),
    Quiz(
        question: "Which is the fastest animal on the land",
        choices: ["fine", "okey", "not bad", "not good"],
        image: "https://picsum.photos/250?image=7",
        answer: "fine"),
    Quiz(
        question: "what is the first month of the year?",
        choices: ["fine", "okey", "not bad", "not good"],
        image: "https://picsum.photos/250?image=6",
        answer: "fine"),
    Quiz(
        question: "How many month of the year?",
        choices: ["fine", "okey", "not bad", "not good"],
        image: "https://picsum.photos/250?image=5",
        answer: "fine"),
  ];

  List<AnsweredQuiz> userAnswers = [];

  late Timer timer;
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 3;

  int currentSeconds = 0;
  int currentQuiz = 0;

  startTimeout([int? milliseconds]) {
    var duration = interval;
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          processQuiz("");
        }
      });
    });
  }

  processQuiz(String userAnswer) {
    userAnswers.add(
                          AnsweredQuiz(question: quizList[currentQuiz].question, correctAnswer: quizList[currentQuiz].answer, userAnswer: userAnswer)
                        );
    timer.cancel();
    if (currentQuiz == (quizList.length - 1)) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>  ScorePage(userAnswer: userAnswers,)));
    } else {
      currentQuiz += 1;
      startTimeout();
    }
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.primaryColor,
        title: const Text("Quiz Page"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Exit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Constant.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LinearProgressIndicator(
              backgroundColor: Constant.bgTimerColor,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Constant.secondaryColor),
              value: currentSeconds / timerMaxSeconds,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    quizList[currentQuiz].question,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  quizList[currentQuiz].image != ""
                      ? Image.network(quizList[currentQuiz].image!)
                      : Container()
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: quizList[currentQuiz].choices.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(50),
                          shape: const StadiumBorder()),
                      onPressed: () {
                        processQuiz(quizList[currentQuiz].choices[index]);
                      },
                      child: Text(
                        quizList[0].choices[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
