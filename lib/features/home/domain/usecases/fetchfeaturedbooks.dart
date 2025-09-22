 import 'package:book_app/core/errors/failure.dart';

import 'package:dart_either/dart_either.dart';

import '../entities/book_entity.dart';
import '../repo/home_repo.dart';

class FetchFeaturedBooksUseCase{

   final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);
   Future<Either<Failure,List<BookEntity>>>call(){
     return homeRepo.fetchFeaturedBooks();
   }

 }