// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/QuizQuestion.dart';

class QuizQuestionview extends StatefulWidget {
  const QuizQuestionview(this.chooseAns, {super.key});
  final void Function(String ans) chooseAns;

  @override
  State<QuizQuestionview> createState() => _QuizQuestionviewState();
}

class _QuizQuestionviewState extends State<QuizQuestionview> {
  var CurrIndex = 0;

  void ansQuestion(String ans) {
    widget.chooseAns(ans);
    setState(() {
      CurrIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion ques = questions[CurrIndex];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            ques.ques,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          //'...' -> spread operator convert list into individual widgets and we are using spread operator because column has a list and list inside list is not allowed as it can only contain widgets
          ...ques.GetShuffledList().map((ans) {
            return ansButton(
                BTtext: ans,
                onTap: () {
                  ansQuestion(ans);
                });
          })
        ]),
      ),
    );
  }
}

class ansButton extends StatelessWidget {
  const ansButton({
    required this.BTtext,
    required this.onTap,
    super.key,
  });
  final String BTtext;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40)),
        child: Text(
          BTtext,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
