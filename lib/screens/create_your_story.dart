import 'package:flutter/material.dart';
import 'package:makeen/screens/story_reading_page.dart';

class CreateYourStoryPage extends StatefulWidget {
  const CreateYourStoryPage({Key? key}) : super(key: key);

  @override
  State<CreateYourStoryPage> createState() => _CreateYourStoryPageState();
}

class _CreateYourStoryPageState extends State<CreateYourStoryPage> {
  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('اصنع قصتك بنفسك'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'اصنع قصتك بنفسك',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Form(
                    key: _form,
                    child: TextFormField(
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: 'اكتب قصتك هنا',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء كتابة القصة';
                        }
                        return null;
                      },
                    )),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      // Navigate to the question to complete the story
                      // read the story page
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const StoryReadingPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('الرجاء كتابة القصة'),
                        ),
                      );
                    }
                  },
                  child: const Text('انشاء قصة'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
