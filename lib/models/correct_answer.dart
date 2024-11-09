import 'package:isar/isar.dart';

part 'correct_answer.g.dart';

@collection
class CorrectAnswer {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? question;
}
