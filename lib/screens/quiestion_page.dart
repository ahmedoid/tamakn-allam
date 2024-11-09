import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:makeen/main.dart';
import 'package:makeen/models/score_model.dart';
import 'package:makeen/models/wrong_answers.dart';
import 'package:makeen/screens/navigation_page.dart';
import 'package:makeen/screens/result_page.dart';
import 'package:makeen/screens/story_reading_page.dart';

class QuizPage extends StatefulWidget {
  final int storyPart;
  final int score;
  const QuizPage({super.key, required this.storyPart, required this.score});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool showCorrectAnswer = false;
  String selectedAnswer = '';
  late Flushbar flush;

  final List<Map<String, dynamic>> questions = [
    {
      "question_type": "multiple_choice",
      "question":
          "في الجملة التالية 'كان يا مكان في قرية صغيرةٍ يعيش طفلٌ صغيرٌ يدعى أمير، كان يحب استكشاف العالم من حوله ويتعلم منه الكثير. يوماً ما قرر أمير الذهاب في رحلةٍ استكشافيةٍ في الغابة القريبة من قريته.' ماذا يعرب 'قرية'؟",
      "options": ["حرف جر", "صفة", "اسم مجرور", "مبتدأ"],
      "correct_answer": "صفة"
    },
    {
      "question_type": "multiple_choice",
      "question":
          "ماذا يعرب 'في' في الجملة 'في قرية صغيرةٍ يعيش طفلٌ صغيرٌ يدعى أمير، كان يحب استكشاف العالم من حوله ويتعلم منه الكثير. يوماً ما قرر أمير الذهاب في رحلةٍ استكشافيةٍ في الغابة القريبة من قريته.'؟",
      "options": ["حرف جر", "صفة", "اسم مجرور", "مبتدأ"],
      "correct_answer": "حرف جر"
    },
    {
      "question_type": "multiple_choice",
      "question":
          "في الجملة 'كان يا مكان في قرية صغيرةٍ يعيش طفلٌ صغيرٌ يدعى أمير، كان يحب استكشاف العالم من حوله ويتعلم منه الكثير. يوماً ما قرر أمير الذهاب في رحلةٍ استكشافيةٍ في الغابة القريبة من قريته.' ما هو موقع الجملة 'كان يا مكان'؟",
      "options": ["مبتدأ", "خبر", "صفة", "ظرف"],
      "correct_answer": "مبتدأ"
    }
  ];

  void checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
      showCorrectAnswer = true;
      // save question obj as a string

      if (answer == questions[currentQuestionIndex]['correct_answer']) {
        score += 1 + widget.score;
      }
    });
    // snack bar
    flush = Flushbar(
      borderRadius: BorderRadius.circular(8),
      margin: EdgeInsets.all(8),
      backgroundColor:
          answer == questions[currentQuestionIndex]['correct_answer']
              ? Colors.green
              : Colors.red,
      icon: Icon(
        answer == questions[currentQuestionIndex]['correct_answer']
            ? Icons.check
            : Icons.close,
        color: Colors.white,
      ),
      message: answer == questions[currentQuestionIndex]['correct_answer']
          ? questions[currentQuestionIndex]['correct_answer']
          : " الإجابة الصحيحة: ${questions[currentQuestionIndex]['correct_answer']}",
      titleText: answer == questions[currentQuestionIndex]['correct_answer']
          ? Text("احسنت", style: TextStyle(color: Colors.white, fontSize: 20))
          : Text("إجابة خاطئة",
              style: TextStyle(color: Colors.white, fontSize: 20)),
      isDismissible: false,
      messageSize: 18,
      animationDuration: Duration(milliseconds: 500),
      mainButton: TextButton(
        onPressed: nextQuestion,
        child: Text(
          currentQuestionIndex < questions.length - 1
              ? ("التالي")
              : ("انتهاء الاختبار"),
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    )..show(context);
  }

  void nextQuestion() {
    flush.dismiss();
    setState(() {
      showCorrectAnswer = false;
      selectedAnswer = '';
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex += 1;
        // pop the snack bar
        //Navigator.pop(context);
      } else {
        if (widget.storyPart == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoryReadingPage(part: 2, score: score),
            ),
          );
        } else {
          // home page
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => TestResultPage(
                      score: score,
                    )),
            (route) => false,
          );
        }
      }
    });
  }

  void showQuizEndDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("النتيجة"),
        content: Text("نتيجتك $score من ${questions.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              resetQuiz();
            },
            child: Text("Restart"),
          ),
        ],
      ),
    );
  }

  void resetQuiz() {
    setState(() {
      score = 0;
      currentQuestionIndex = 0;
      showCorrectAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var question = questions[currentQuestionIndex];
    // shuffle options
    final List<String> options = List<String>.from(question['options'])
      ..shuffle();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          title: LinearProgressIndicator(
        value: (currentQuestionIndex + 1) / questions.length,
        minHeight: 8,
        backgroundColor: Colors.grey[300],
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  question['question'],
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            ...options.map((option) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAnswer == option
                        ? (option == question['correct_answer']
                            ? Colors.green
                            : Colors.red)
                        : Colors.white,
                  ),
                  onPressed:
                      showCorrectAnswer ? null : () => checkAnswer(option),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(option,
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
              );
            }).toList(),
            Spacer()
          ],
        ),
      ),
    );
  }
}
