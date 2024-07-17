import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.onRestart, {super.key});

  final void Function() onRestart;

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
            const Text('results'),
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