import 'package:book_app/core/errors/failure.dart';
import 'package:dart_either/dart_either.dart';

 abstract class NoParamUseCase<Type>{

  Future<Either<Failure,Type>> call();
}