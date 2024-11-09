import 'package:flutter/material.dart';
import 'package:makeen/screens/navigation_page.dart';

class LevelResult extends StatelessWidget {
  const LevelResult(
      {super.key,
      required this.level,
      required this.correctAnswers,
      required this.totalQuestions,
      required this.duration});

  final String level;
  final int correctAnswers;
  final int totalQuestions;
  final int duration;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نتيجة الاختبار'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                'مستوى الطالب: $level',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                  'مبروك! لقد حصلت على المستوى ${level} في القواعد. استمر في العمل الجديد واستمر في التدريب للوصول إلى المستوى المتقدم.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.grey.shade700,
                  )),
            ),
            const SizedBox(height: 20.0),
            Image.asset('assets/images/student_success.png',
                height: MediaQuery.of(context).size.height * 0.3),
            const SizedBox(height: 20.0),
            Center(
              child: Text(
                'ملخص الأداء',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CircularProgressIndicator(
                        value: 1 - (correctAnswers / totalQuestions),
                        color: Colors.red,
                        backgroundColor: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 8.0),
                      Text('${100 - (correctAnswers / totalQuestions * 100)}%'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      CircularProgressIndicator(
                        value: correctAnswers / totalQuestions,
                        color: Colors.green,
                        backgroundColor: Colors.grey.shade300,
                        semanticsLabel: 'الإجابات الصحيحة',
                      ),
                      const SizedBox(height: 8.0),
                      Text('${correctAnswers / totalQuestions * 100}%'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Text(
                'الوقت المستغرق: ${duration} دقائق',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyNavigationBar()
                        // MyNavigationBar()
                        ),
                    (route) => false,
                  );
                },
                child: const Text('الذهاب إلى الرئيسية'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
