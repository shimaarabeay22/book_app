import 'package:book_app/features/home/domain/usecases/fetchfeaturedbooks.dart';
import 'package:book_app/features/home/presentation/featured_books_cubit/featured_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.fetchFeaturedBooksUseCase) :super(FeaturedBookInitial());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());
    var result = await fetchFeaturedBooksUseCase.call();
    result.fold(ifLeft: (failure) {
      emit(FeaturedBookFailure(failure.message));
    },
         ifRight:   (books) {
          emit(FeaturedBookSuccess(books));
        });
  }
}