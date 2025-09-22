
import 'package:book_app/features/home/domain/entities/book_entity.dart';

abstract class NewsedBookState{}
class NewsedBookInitial extends NewsedBookState{}
class NewsedBookLoading extends NewsedBookState{}
class NewsedBookFailure extends NewsedBookState{
  final String message;

  NewsedBookFailure(this.message);

}
class NewsedBookSuccess extends NewsedBookState{
  final List<BookEntity> book;

  NewsedBookSuccess(this.book);
}