
import 'package:book_app/features/home/domain/usecases/fetchnewsbooks.dart';
import 'package:book_app/features/home/presentation/newsed_book_cubit/newsed_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsedBookCubit extends Cubit<NewsedBookState> {
  NewsedBookCubit(this.newsBooksUseCase) : super(NewsedBookInitial());
  final FetchNewsBooksUseCase newsBooksUseCase;

  Future<void> fetchNewsedBooks() async {
    emit(NewsedBookLoading());
    var result = await newsBooksUseCase.call();
    result.fold(ifLeft: (failure) {
      NewsedBookFailure(failure.message);
    }, ifRight: (book) {
      NewsedBookSuccess(book);
    });
  }
}
