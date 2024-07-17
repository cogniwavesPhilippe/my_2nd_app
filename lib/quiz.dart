import 'package:flutter/material.dart';
import 'package:my_2nd_app/questions_screen.dart';
import 'package:my_2nd_app/start_screen.dart';
import 'package:my_2nd_app/results_screen.dart';
import 'package:my_2nd_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start_screen';

  @override
  void initState() {
    super.initState();
  }

  void switchScreen() {
    if (selectedAnswers.length == questions.length) {
      if (activeScreen == 'questions_screen') {
        setState(() {
          activeScreen = 'results_screen';
        });
      } else {
        setState(() {
          selectedAnswers = [];
          activeScreen = 'start_screen';
        });
      }
    } else if (activeScreen == 'start_screen') {
      setState(() {
        activeScreen = 'questions_screen';
      });
    }
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    switchScreen();
  }

  @override
  Widget build(context) {
    Widget screenWidget;

    if (activeScreen == 'questions_screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'results_screen') {
      screenWidget = ResultsScreen(
        onRestart: switchScreen,
        chosenAnswers: selectedAnswers,
      );
    } else {
      screenWidget = StartScreen(switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 9, 95, 64),
                Color.fromARGB(255, 16, 151, 101)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: screenWidget),
      ),
    );
  }
}
