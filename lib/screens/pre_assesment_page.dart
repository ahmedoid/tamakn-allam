// Sample questions JSON data
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:makeen/screens/level_result.dart';

// Sample questions JSON data
const List<Map<String, dynamic>> questions = [
  {
    "question": "ما إعراب كلمة \"الكتاب\" في الجملة: \"قرأت الكتابَ\"؟",
    "options": ["فاعل", "مفعول به", "مبتدأ", "خبر"],
    "correct_answer": "مفعول به",
    "weight": 2
  },
  {
    "question": "ما إعراب كلمة \"جميلة\" في الجملة: \"الحديقةُ جميلةٌ\"؟",
    "options": ["فاعل", "خبر", "مفعول به", "صفة"],
    "correct_answer": "خبر",
    "weight": 2
  },
  {
    "question": "ما إعراب كلمة \"في\" في الجملة: \"الولد في المدرسة\"؟",
    "options": ["حرف جر", "اسم مجرور", "فاعل", "مفعول به"],
    "correct_answer": "حرف جر",
    "weight": 1
  },
  {
    "question": "ما إعراب كلمة \"أحمد\" في الجملة: \"أحب أحمدَ\"؟",
    "options": ["مبتدأ", "فاعل", "مفعول به", "خبر"],
    "correct_answer": "مفعول به",
    "weight": 3
  },
  {
    "question":
        "ما إعراب كلمة \"التعليم\" في الجملة: \"أهمية التعليم كبيرةٌ\"؟",
    "options": ["فاعل", "مبتدأ", "خبر", "مفعول به"],
    "correct_answer": "مبتدأ",
    "weight": 2
  }
];

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  Map<int, String> selectedAnswers = {};
  List<String> shuffledOptions = [];
  DateTime startTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    shuffleOptions(); // Initial shuffle for the first question
  }

  void shuffleOptions() {
    shuffledOptions =
        List<String>.from(questions[currentQuestionIndex]['options']);
    shuffledOptions.shuffle(Random());
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('تقييم مستواك'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              question['question'],
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            ...shuffledOptions.map<Widget>((option) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RadioListTile(
                    title: Text(option),
                    value: option,
                    groupValue: selectedAnswers[currentQuestionIndex],
                    onChanged: (value) {
                      setState(() {
                        selectedAnswers[currentQuestionIndex] = value as String;
                      });
                    },
                  ),
                ),
              );
            }).toList(),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                if (currentQuestionIndex < questions.length - 1) {
                  setState(() {
                    currentQuestionIndex++;
                    shuffleOptions(); // Shuffle options for next question
                  });
                } else {
                  _showResults(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                    currentQuestionIndex < questions.length - 1
                        ? 'التالي'
                        : 'إظهار النتائج',
                    style: TextStyle(fontSize: 20.0)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showResults(BuildContext context) {
    DateTime endTime = DateTime.now();
    Duration duration = endTime.difference(startTime);
    // duration is in milliseconds to minutes
    int minutes = duration.inMinutes;
    int totalWeight = 0;
    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i]['correct_answer']) {
        totalWeight += questions[i]['weight'] as int;
        correctAnswers++;
      }
    }

    String level;
    if (totalWeight < 5) {
      level = "مستوى 1";
    } else if (totalWeight <= 8) {
      level = "مستوى 2";
    } else {
      level = "مستوى 3";
    }

    // got to LevelResult page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LevelResult(
          level: level,
          correctAnswers: correctAnswers,
          totalQuestions: questions.length,
          duration: minutes,
        ),
      ),
    );

    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       title: Text("النتائج"),
    //       content: Text("إجمالي النقاط: $totalWeight\nالمستوى: $level"),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //             setState(() {
    //               currentQuestionIndex = 0;
    //               selectedAnswers.clear();
    //               shuffleOptions(); // Reset and shuffle for the first question
    //             });
    //           },
    //           child: Text("إعادة المحاولة"),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}
