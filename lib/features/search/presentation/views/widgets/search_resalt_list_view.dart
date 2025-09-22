import 'package:book_app/features/home/domain/entities/book_entity.dart';
import 'package:book_app/features/home/presentation/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';


class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.book});
  final List<BookEntity> book;
  @override
  Widget build(BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .25,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: BestSellerListViewItem(
                    bookName: book[index].title,
                    image: book[index].image ?? '',
                    price: book[index].price as num,
                    authorName: book[index].authorName ?? '',
                    rate1: 00,
                    bookRate: book[index].rating as num,
                  ),
                );
              }),
        );
  }
}
