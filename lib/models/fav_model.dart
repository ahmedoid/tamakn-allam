import 'package:isar/isar.dart';

part 'fav_model.g.dart';

@collection
class FavModel {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  String? question;
    DateTime createdDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

}
