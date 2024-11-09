import 'package:isar/isar.dart';

part 'try_model.g.dart';

@collection
class TryModel {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  int? tryNumber;
  DateTime createdDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
}
