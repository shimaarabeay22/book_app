
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/data/model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchResult(
      {required String name});
}