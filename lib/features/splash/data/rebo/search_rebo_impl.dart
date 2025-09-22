
import 'package:book_app/features/splash/data/rebo/search_rebo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/errors/failure.dart';
import '../../../home/data/model/book_model.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResult(
      {required String name}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=$name');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(
          BookModel.fromJson(item),
        );
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(

          e.toString(),
        ),
      );
    }
  }
}