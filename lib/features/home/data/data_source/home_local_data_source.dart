import 'package:book_app/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource{
  List<BookEntity>fetchFeaturedBooks();
  List<BookEntity>fetchNewsBooks();
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
   var box = Hive.box<BookEntity>(keyFeaturedBox);
   return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewsBooks() {
    var box = Hive.box<BookEntity>(keyNewestBox);
    return box.values.toList();
  }

}