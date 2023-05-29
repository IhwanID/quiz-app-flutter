import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResultQuestionAnswerWidget extends StatelessWidget {
  const ResultQuestionAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("Question here?"),
      Row(children: const [
        Text("Image here"), 
      ],)
    ],);
  }
}