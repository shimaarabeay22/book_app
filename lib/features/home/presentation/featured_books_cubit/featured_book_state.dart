 import 'package:book_app/features/home/domain/entities/book_entity.dart';

abstract class FeaturedBookState{}
 class FeaturedBookInitial extends FeaturedBookState{}
 class FeaturedBookLoading extends FeaturedBookState{}
 class FeaturedBookFailure extends FeaturedBookState{
  final String message;

  FeaturedBookFailure(this.message);
 }
 class FeaturedBookSuccess extends FeaturedBookState{

 final List <BookEntity>books;

  FeaturedBookSuccess(this.books);
 }