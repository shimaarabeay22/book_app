import 'package:book_app/features/home/presentation/featured_books_cubit/featured_book_state.dart';
import 'package:book_app/features/home/presentation/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_featured_books_list_view.dart';

class FeaturedBookListViewBlocBuilder extends StatelessWidget {
  const FeaturedBookListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit,FeaturedBookState>(
      builder: (BuildContext context,  state) {
        if(state is FeaturedBookSuccess){
      return FeaturedBooksListView(books: state.books);}
        else if (state is FeaturedBookFailure){
          return Text(state.message);
        }
        else {
          return const CircularProgressIndicator();
        }
      },
     );
  }
}
