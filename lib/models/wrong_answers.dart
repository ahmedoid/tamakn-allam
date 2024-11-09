import 'package:isar/isar.dart';

part 'wrong_answers.g.dart';

@collection
class WrongAnswers {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? question;
}
