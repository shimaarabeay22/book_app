import 'package:book_app/features/home/presentation/newsed_book_cubit/newsed_book_cubit.dart';
import 'package:book_app/features/home/presentation/newsed_book_cubit/newsed_book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view.dart';

class NewsBookListViewBlocBuilder extends StatelessWidget {
  const NewsBookListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsedBookCubit,NewsedBookState>(
        builder: (context,state){
          if (state is NewsedBookSuccess) {
        return BestSellerListView(book: state.book);
      }
          else if (state is NewsedBookFailure){
            return Text(state.message);
          }
          else {
            return const CircularProgressIndicator();
          }
    }
    );
  }
}
