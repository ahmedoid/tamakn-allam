import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeen/screens/create_your_story.dart';
import 'package:makeen/screens/story_reading_page.dart';
import 'package:makeen/screens/welcome_page.dart';

class Story {
  final String title;
  final String description;
  final String level;
  final List<String> suggestedActivities;

  Story(
      {required this.title,
      required this.description,
      required this.level,
      required this.suggestedActivities});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      title: json['title'],
      description: json['description'],
      level: json['level'],
      suggestedActivities: List<String>.from(json['suggestedActivities']),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryListScreenState createState() => _StoryListScreenState();
}

class _StoryListScreenState extends State<StoryPage> {
  late Future<List<Story>> futureStories;
  Future<List<Story>> loadStories() async {
    final String response = await rootBundle.loadString('assets/json/stories.json');
    final List<dynamic> data = json.decode(response)['stories'];
    return data.map((json) => Story.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    futureStories = loadStories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('القصص '),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateYourStoryPage()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return FutureBuilder<List<Story>>(
            future: futureStories,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return StoryCardWidget(
                    story: snapshot.data![index].title,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StoryReadingPage()),
                      );
                    },
                    ImageUrl:
                        'https://images.unsplash.com/photo-1579762687857-b2f08f7cd067?q=80&w=1930&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          );
        },
      ),
    );
  }
}
