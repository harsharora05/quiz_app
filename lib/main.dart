import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/endScreenView.dart';
import 'package:quiz_app/screens/quiz_questionView.dart';
import 'package:quiz_app/screens/quiz_startView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? activescreen;
  Widget? screenWidget;

  @override
  void initState() {
    super.initState();
    activescreen = "start-screen";
  }

  void switchscreen() {
    setState(() {
      activescreen = "Questions-screen";
    });
  }

  List<String> selectedAns = [];

  void chooseAns(String ans) {
    selectedAns.add(ans);

    if (selectedAns.length == questions.length) {
      setState(() {
        activescreen = "end-screen";
      });
    }
  }

  void restartQuiz() {
    selectedAns = [];
    setState(() {
      activescreen = "start-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    if (activescreen == "start-screen") {
      screenWidget = QuizStartview(switchscreen);
    } else if (activescreen == "Questions-screen") {
      screenWidget = QuizQuestionview(chooseAns);
    } else if (activescreen == "end-screen") {
      screenWidget = endScreenView(
        restartQuiz,
        choosenAns: selectedAns,
      );
    }

    return MaterialApp(
      title: 'QuizApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: screenWidget,
    );
  }
}
