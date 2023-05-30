import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/model/topic.dart';
import 'package:quiz_app/quiz_page.dart';
import 'package:quiz_app/utils/constant.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key});

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {

  Future<List<Topic>> getTopicList() async {
    final querySnapshot = await FirebaseFirestore.instance.collection('topics').get();
    List<QueryDocumentSnapshot> docs = querySnapshot.docs;
    final topicList = docs
        .map((doc) => Topic.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return topicList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Topics"),
        backgroundColor: Constant.primaryColor,
      ),
      backgroundColor: Constant.primaryColor,
      body: SafeArea(
        child: FutureBuilder<List<Topic>>(
          future: getTopicList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                '${snapshot.error}',
                style: const TextStyle(color: Colors.white),
              );
            }

            if (!snapshot.hasData) {
              return const Text("Loading");
            }

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return TopicItemWidget(topic: snapshot.data![index].title);
              },
            );
          },
        ),
      ),
    );
  }
}

class TopicItemWidget extends StatelessWidget {
  const TopicItemWidget({
    Key? key,
    required this.topic,
  }) : super(key: key);

  final String topic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, right: 16, left: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Constant.blueDarkColor,
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  QuizPage(topic: topic)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                topic,
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
  }
}
