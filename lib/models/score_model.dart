import 'package:isar/isar.dart';

part 'score_model.g.dart';

@collection
class ScoreModel {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  DateTime createdDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  int? score;
}
