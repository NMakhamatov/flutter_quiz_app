import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/data/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> result = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      result.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    final totalQuestions = questions.length;
    final correctQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("You answered $correctQuestions out of $totalQuestions questions correctly!"),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton(
              onPressed: () {}, 
              child: Text('Restart quiz!'),
              ),
          ],
        ),
      ),
    );
  }
}