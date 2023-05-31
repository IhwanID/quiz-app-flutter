import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_page.dart';
import 'package:quiz_app/topic_page.dart';
import 'package:quiz_app/utils/constant.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.primaryColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(
                  Icons.lightbulb,
                  color: Colors.yellow,
                  size: 48.0,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Flutter Quiz App",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text("Learn - Take Quiz - Repeat",
                    style: TextStyle(fontSize: 12, color: Colors.white)),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constant.blueSkyColor,
                        minimumSize: const Size.fromHeight(50),
                         shape: const StadiumBorder()
                        
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const QuizPage(topic: "random",)),
                        );
                      },
                      child: const Text("PLAY")),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Constant.primaryColor,
                        minimumSize: const Size.fromHeight(50),
                        side: const BorderSide(
                          width: 1.0,
                          color: Constant.blueSkyColor,
                        ),
                         shape: const StadiumBorder()),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TopicPage()),
                      );
                    },
                    child: const Text('TOPICS', style: TextStyle(color: Constant.blueSkyColor),),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      icon: const Icon(
                        Icons.share,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        Share.share('Quiz App is best app XD');
                      },
                      label: const Text('Share'),
                    ),
                    TextButton.icon(
                      icon: const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      onPressed: () {},
                      label: const Text('Rate Us'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
