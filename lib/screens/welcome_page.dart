import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:makeen/main.dart';
import 'package:makeen/models/fav_model.dart';
import 'package:makeen/models/score_model.dart';
import 'package:makeen/models/try_model.dart';
import 'package:makeen/models/wrong_answers.dart';
import 'package:isar/isar.dart';
import 'package:makeen/main.dart';
import 'package:makeen/models/fav_model.dart';
import 'package:makeen/models/score_model.dart';
import 'package:makeen/models/try_model.dart';
import 'package:makeen/models/wrong_answers.dart';
import 'package:makeen/screens/create_your_story.dart';
import 'package:makeen/screens/story_page.dart';
import 'package:makeen/screens/story_reading_page.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final bool enabled;

  const IconWithText({
    required this.icon,
    required this.color,
    required this.text,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: enabled ? color : Colors.grey,
          size: 20,
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: enabled ? Colors.white : Colors.grey,
          ),
        ),
      ],
    );
  }
}

class WelcomePage extends StatefulWidget {
  final String userName;
  const WelcomePage({Key? key, required this.userName}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late int wrongAnswersCount;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconWithText(
              icon: Icons.favorite,
              color: Colors.red,
              text: '3',
            ),
            SizedBox(width: 16),
            FutureBuilder<int?>(
                future: getScoreSum(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return IconWithText(
                    icon: Icons.star,
                    color: Colors.amber.shade600,
                    text: '${snapshot.data}',
                  );
                }),
            SizedBox(width: 16),
            Icon(
              Icons.flag,
              color: Colors.red,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // hi user
              Text(
                'مرحبا، ${widget.userName} 👋',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.start,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'ماذا تريد أن تتعلم اليوم؟',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // grid view with 4 items
              SizedBox(height: 16),
              // SizedBox(
              //   child: Example9Horizontal(),
              //   height: 200,
              // ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // item 1
                  StoryCardWidget(
                    story: 'الطبيعة',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StoryReadingPage()),
                      );
                    },
                    ImageUrl:
                        'https://img.freepik.com/free-vector/nature-seamless-vector-landscape-with-hills-trees-mountains-outdoor-sky-grass-summer-cartoon-meadow-season-panorama-illustration_1284-46309.jpg?t=st=1731137458~exp=1731141058~hmac=c255b50e751867a12fe60af07bd4f4bfe69622c8ffa1ed51b841a78f315e1d85&w=1060',
                  ),
                  // item 2
                  StoryCardWidget(
                    story: 'العائلة',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StoryReadingPage()),
                      );
                    },
                    ImageUrl:
                        'https://img.freepik.com/free-vector/big-family-garden_1308-25341.jpg?t=st=1731137512~exp=1731141112~hmac=ce070f8da07a3692c84eb09e9d1c5c6dde377f257cf8cedb8c94c2375d26aeae&w=996',
                  ),
                  // item 3
                  StoryCardWidget(
                    story: 'الحيونات',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StoryReadingPage()),
                      );
                    },
                    ImageUrl:
                        'https://img.freepik.com/free-vector/cute-wild-animals-forest_1308-138707.jpg?t=st=1731137552~exp=1731141152~hmac=dccc0227baa45ffb1030b4c60efc5f0739ae3f9fc3a700bb734619adee61bd3e&w=1060',
                  ),
                  // item 4
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StoryPage()),
                      );
                    },
                    child: Card(
                      color: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.more, size: 40.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),

              Card(
                child: FutureBuilder<int?>(
                    future: getScoreSum(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      return ListTile(
                        leading: CircularProgressIndicator(
                          value: getProgress(snapshot.data ?? 0),
                          backgroundColor: Colors.grey,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                        title: FutureBuilder<int?>(
                            future: getScoreSum(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              return Text(
                                'المستوى ${levelByScore(snapshot.data ?? 0)}',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              );
                            }),
                        subtitle: Text(
                          'الوحدة الأولى: المبتدا والخبر',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateYourStoryPage()),
                  );
                },
                icon: Icon(Icons.book),
                label: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("انشاء قصة جديدة"),
                ),
              ),
              const SizedBox(height: 20.0),
              // create three cards with hight 100 in rows only three cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: StatCardWidget(
                      title: 'القصص',
                      value: '5',
                      icon: Icons.book,
                      color: Colors.cyan,
                    ),
                  ),
                  Expanded(
                    child: StatCardWidget(
                      title: 'الاسئلة',
                      value: '100',
                      icon: Icons.check,
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<Object>(
                        future: getWrongAnswerCount(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          return StatCardWidget(
                            title: 'اخطاء',
                            value: snapshot.data.toString(),
                            icon: Icons.close,
                            color: Colors.red,
                          );
                        }),
                  ),
                  Expanded(
                    child: StatCardWidget(
                      title: 'المفضلة',
                      value: '5',
                      icon: Icons.favorite,
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Card(
                elevation: 0.0,
                color: Colors.blueGrey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'إنجازاتك',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatCard('مستوى القواعد', 'جيد', Icons.school),
                          _buildStatCard(
                              'التقدم العام', '60%', Icons.trending_up),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon,
      {Color textColor = Colors.black}) {
    return Column(
      children: [
        Icon(icon, size: 40.0, color: Colors.amber.shade600),
        const SizedBox(height: 10.0),
        Text(
          value,
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: textColor),
        ),
        const SizedBox(height: 5.0),
        Text(title,
            style: TextStyle(
                fontSize: 16.0, fontWeight: FontWeight.bold, color: textColor)),
      ],
    );
  }

  getWrongAnswerCount() {
    return isar.wrongAnswers.count();
  }

  // getCorrectAnswerCount() {
  //   return isar.correctAnswers.count();
  // }
  getFavoriteAnswerCount() {
    return isar.favModels.count();
  }

  getSTryCount() {
    return isar.tryModels.count();
  }

  // getQuestionCount() {
  //   return isar.questions.count();
  // }
  // getAchievementCount() {
  //   return isar.achievements.count();
  // }
  getScoreSum() {
    return isar.scoreModels.where().scoreProperty().max();
  }

  levelByScore(int i) {
    // create a formela to level user from 1 to 200, 200 is the max level, without using if statment
    if (i < 10) {
      return '1';
    } else if (i < 20) {
      return '2';
    } else if (i < 30) {
      return '3';
    } else if (i < 40) {
      return '4';
    } else if (i < 50) {
      return '5';
    } else if (i < 60) {
      return '6';
    } else if (i < 70) {
      return '7';
    } else if (i < 80) {
      return '8';
    } else if (i < 90) {
      return '9';
    } else if (i < 100) {
      return '10';
    }
  }

  int getLevel(int score) {
    int level = 1;
    int requiredScore = 10;

    while (score >= requiredScore) {
      score -= requiredScore;
      level++;
      requiredScore = level * 10;
    }

    return level;
  }

  double getProgress(int score) {
    int level = getLevel(score);
    int previousRequiredScore = (level - 1) * 10;
    int currentRequiredScore = level * 10;

    int scoreInLevel = score - previousRequiredScore;
    int scoreForNextLevel = currentRequiredScore - previousRequiredScore;

    return scoreInLevel / scoreForNextLevel;
  }
}

class StatCardWidget extends StatelessWidget {
  const StatCardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // icon
            Icon(icon, size: 40.0, color: Colors.white),
            const SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            Text(
              value,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryCardWidget extends StatelessWidget {
  const StoryCardWidget({
    super.key,
    required this.story,
    required this.onTap,
    required this.ImageUrl,
  });
  final String story;
  final Function onTap;
  final String ImageUrl;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  ImageUrl,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  colorBlendMode: BlendMode.color,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                ),
              ),
            ),
            // gradient overlay
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(story,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
