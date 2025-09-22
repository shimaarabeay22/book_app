import 'package:book_app/features/home/domain/entities/book_entity.dart';
import 'package:book_app/features/home/presentation/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key, required this.book});

  final List<BookEntity> book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: BestSellerListViewItem(
                bookName: book[index].title,
                authorName: book[index].authorName ?? '',
                image: book[index].image ?? '',
                price: book[index].price as num,
                rate1: book[index].rating as num,
                bookRate: book[index].rating as num,
              ),
            );
          }),
    );
  }
}
