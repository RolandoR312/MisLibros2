import 'package:hive/hive.dart';
import 'package:mis_libros/models/local_book.dart';

class Boxes {
  static Box<LocalBook> getFavoritesBox() => Hive.box<LocalBook>('favorites');
}
