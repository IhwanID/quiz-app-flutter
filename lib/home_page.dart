import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
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
                const SizedBox(height: 16,),
                const Text("Flutter Quiz App", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),),
                const SizedBox(height: 8,),
                const Text("Learn - Take Quiz - Repeat", style: TextStyle(fontSize: 12, color: Colors.white)),
                const SizedBox(height: 32,),
                Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                  onPressed: () {
                    
                  },
                  child: const Text("Play")),
                ),
                const SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      minimumSize: const Size.fromHeight(50),
                      side: const BorderSide(
                    width: 1.0,
                    color: Colors.blue,
                  )),
                    onPressed: () {},
                    child: const Text('Topics'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.share, color: Colors.blue,),
                      onPressed: () {},
                      label: const Text('Share'),
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.star, color: Colors.yellow,),
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
