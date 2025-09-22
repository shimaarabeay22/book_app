

import 'package:book_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/repo/home_repo.dart';
import '../data_source/home_local_data_source.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeLocalDataSourceImpl homeLocalDataSourceImpl;
  final HomeRemoteDataSourceImpl homeRemoteDataSourceImpl;

  HomeRepoImpl( this.homeRemoteDataSourceImpl,  this.homeLocalDataSourceImpl);
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks()async {
     try {

       var bookList = await homeLocalDataSourceImpl.fetchFeaturedBooks();
       if(bookList.isNotEmpty){
         return Right(bookList);
       }
        var books = await homeRemoteDataSourceImpl.fetchFeaturedBooks();
       return Right(books);
     } on Exception catch (e) {
       if (e is DioError){
       return Left(ServerFailure.fromDioError(e));
       }else{
         return Left( ServerFailure(e.toString()));
       }
     }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsBooks()async {
    try {
      var bookList = await homeLocalDataSourceImpl.fetchNewsBooks();
      if(bookList.isNotEmpty){
        return Right(bookList);
      }
      List<BookEntity> books;
       books = await homeRemoteDataSourceImpl.fetchNewsBooks();
    return Right(books);
  } on Exception catch (e) {
      if (e is DioError){
        return Left(ServerFailure.fromDioError(e));
      }else{
        return Left( ServerFailure(e.toString()));
      }
  }

}
}