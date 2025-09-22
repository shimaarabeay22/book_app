
import 'package:dart_either/dart_either.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/no_param_usecse.dart';
import '../entities/book_entity.dart';
import '../repo/home_repo.dart';

class FetchNewsBooksUseCase extends NoParamUseCase<List<BookEntity>>{
  final HomeRepo homeRepo;
 FetchNewsBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call()async {
    return await homeRepo.fetchNewsBooks();
  }


}