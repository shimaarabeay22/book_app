 import 'package:dart_either/dart_either.dart';

import '../errors/failure.dart';

abstract class UseCase<Type,param> {


   Future<Either<Failure,Type>> call([param param]);

 }