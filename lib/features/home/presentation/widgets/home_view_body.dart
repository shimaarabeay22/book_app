import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/presentation/widgets/News_book_list_view_bloc_builder.dart';
import 'package:book_app/features/home/presentation/widgets/featuerd_book_list_view_bloc_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'custom_featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
               FeaturedBookListViewBlocBuilder(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: GestureDetector(
            onTap:() {
              GoRouter.of(context).push(AppRouter.kBookDetailsView);
            } ,
              child: NewsBookListViewBlocBuilder()),
        )
      ],
    );
  }
}
