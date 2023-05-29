import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_page.dart';
import 'package:quiz_app/utils/constant.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> topics = ["politics", "animals", "gk"];
    return Scaffold(
        appBar: AppBar(
          title: const Text("Topics"),
          backgroundColor: Constant.primaryColor,
        ),
        backgroundColor: Constant.primaryColor,
        body: SafeArea(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: topics.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8, right: 16, left: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constant.blueDarkColor,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuizPage()),
                        );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            topics[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
