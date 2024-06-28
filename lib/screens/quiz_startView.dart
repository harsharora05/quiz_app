import 'package:flutter/material.dart';

class QuizStartview extends StatelessWidget {
  const QuizStartview(this.switchscreen, {super.key});

  final void Function() switchscreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: const Text(
          "Quiz",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Image(image: AssetImage("assets/images/quiz-logo.png")),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Learn Flutter in a Fun Way!!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: switchscreen,
                icon: const Icon(Icons.start),
                label: const Text("Start"))
          ],
        ),
      ),
    );
  }
}
