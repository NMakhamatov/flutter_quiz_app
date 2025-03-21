import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              color: const Color.fromARGB(150, 255, 255, 255),
               height: 200),
            SizedBox(height: 30),
            Text(
              "Learn Flutter the fun way!",
              style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white,),
              icon: const Icon(Icons.arrow_right_alt),
              label: Text("Start quizzz", style: GoogleFonts.lato(fontSize: 16),),
            ),
          ],
        ),
      );
  }
}