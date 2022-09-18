import 'package:hive/hive.dart';

part 'local_book.g.dart';

@HiveType(typeId: 0)
class LocalBook extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? author;

  @HiveField(3)
  String? publishedDate;

  @HiveField(4)
  String? description;

  @HiveField(5)
  String? imageLink;
}
