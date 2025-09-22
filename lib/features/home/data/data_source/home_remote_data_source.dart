import 'package:book_app/constants.dart';
import 'package:book_app/core/api/api_service.dart';

import 'package:hive/hive.dart';
import '../../domain/entities/book_entity.dart';
import '../model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewsBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl( this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?q=subject:Programming&Filtering=free-ebooks');
    List<BookEntity> books = getBookList(data);
    saveData(books,keyFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsBooks() async {
    var data = await apiService.get(
        endPoint:
            'volumes?q=computer science&Sorting=newest &Filtering=free-ebooks');
    List<BookEntity> books = getBookList(data);
    saveData(books,keyNewestBox);
    return books;
  }

  void saveData(List<BookEntity> books,String boxName) {
    var box =Hive.box<BookEntity>(keyFeaturedBox);
    box.addAll(books);
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
