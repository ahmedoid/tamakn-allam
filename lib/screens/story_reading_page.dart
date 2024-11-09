import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeen/screens/quiestion_page.dart';

class StoryReadingPage extends StatefulWidget {
  const StoryReadingPage({Key? key, this.part = 1, this.score = 0})
      : super(key: key);
  final int part;
  final int score;
  @override
  State<StoryReadingPage> createState() => _StoryReadingPageState();
}

class _StoryReadingPageState extends State<StoryReadingPage> {
  String storyPartOne = '';
  String storyPartTwo = '';
// read a json file from assets/json/story.json
  Future<String> loadStory() async {
    return await rootBundle.loadString('assets/json/story.json');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // decode the json file

    return Scaffold(
      appBar: AppBar(
        title: const Text('القصص المقترحة'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20.0),
                  FutureBuilder(
                      future: loadStory(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else {
                          final story = json.decode(snapshot.data.toString());
                          storyPartOne = story['story_part1'];
                          storyPartTwo = story['story_part2'];
                          return Column(
                            children: [
                              Text(
                                widget.part == 1
                                    ? story['story_part1']
                                    : story['story_part2'],
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w100,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        }
                      }),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the question to complete the story
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizPage(
                                  storyPart: widget.part == 1 ? 2 : 3,
                                  score: widget.score,
                                )),
                        (route) => false,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: const Text('انتقل للاختبار'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
