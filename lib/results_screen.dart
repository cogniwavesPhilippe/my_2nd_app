import 'package:flutter/material.dart';
import 'package:my_2nd_app/data/questions.dart';
import 'package:my_2nd_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.onRestart, required this.chosenAnswers});

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i =0; i < questions.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[0]
      });
    }

    return summary;
  }

  @override
  Widget build (context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('You asnwer x questions correctly'),
            const SizedBox(height: 30,),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30,),
            OutlinedButton.icon(
            onPressed: onRestart,
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 10, 95, 64),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Restart Quiz'),
          ),
          ],
        ),
      ),
    );
  }
}