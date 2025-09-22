import 'package:bloc/bloc.dart';
import 'package:book_app/features/search/presentation/views/search_cubit/saerch_state.dart';



import '../../../../splash/data/rebo/search_rebo.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchResult({required String bookName}) async {
    var result = await searchRepo.fetchSearchResult(name: bookName);
    result.fold((Failure) {
      emit(SearchFailure(Failure.message));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}