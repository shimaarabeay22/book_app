import 'package:book_app/features/search/presentation/views/widgets/search_resalt_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../search_cubit/saerch_state.dart';
import '../search_cubit/search_cubit.dart';

class SearchResultListViewBlocBuilder extends StatelessWidget {
  const SearchResultListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
        builder: (BuildContext context, state) {
          if (state is SearchSuccess) {
            return SearchResultListView(book: state.books);
          } else if (state is SearchFailure) {
            return Text(state.errMessage);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
