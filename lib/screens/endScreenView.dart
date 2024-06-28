import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class endScreenView extends StatelessWidget {
  endScreenView(this.restartQuiz, {super.key, required this.choosenAns});

  final List<String> choosenAns;
  final void Function() restartQuiz;

  List<Map<String, dynamic>> GetSummary() {
    List<Map<String, dynamic>> summary = [];
    for (int i = 0; i < questions.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].ques,
        "correct_ans": questions[i].answers[0],
        "selected_ans": choosenAns[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final getSummary = GetSummary();
    int totalquestions = questions.length;
    int correctQuestions = getSummary.where((data) {
      return data['correct_ans'] == data['selected_ans'];
    }).length;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: const Text("Results"),
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: Center(
              child: Column(
            children: [
              Text(
                "You answered $correctQuestions out of $totalquestions questions correctly !!",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 450,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...GetSummary().map((summary) {
                        final isCorrect =
                            summary['correct_ans'] == summary['selected_ans'];
                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Chip(
                                      backgroundColor:
                                          isCorrect ? Colors.green : Colors.red,
                                      label: Text(
                                          (summary['question_index'] + 1)
                                              .toString())),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          summary['question'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          summary['correct_ans'],
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 3, 120, 7)),
                                        ),
                                        Text(
                                            "your Answer :- ${summary['selected_ans']}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.deepPurple))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                  onPressed: restartQuiz,
                  icon: const Icon(Icons.restart_alt),
                  label: const Text("Restart"))
            ],
          ))),
    );
  }
}
