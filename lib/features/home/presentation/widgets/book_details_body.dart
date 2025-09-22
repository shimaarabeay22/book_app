import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/presentation/widgets/book_action.dart';
import 'package:book_app/features/home/presentation/widgets/book_rating.dart';
import 'package:book_app/features/home/presentation/widgets/custom_app_bar_for_book_details.dart';
import 'package:book_app/features/home/presentation/widgets/custom_image.dart';
import 'package:book_app/features/home/presentation/widgets/similar_book_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [

        CustomAppBarForBookDetails(),
        ////////////////////////////////////////////////////////////////
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: CustomBookImage (image:'' ,),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'The Most Book',
          style: Styles.textStyle30,
        ),
        SizedBox(
          height: 10,
        ),
        Text('Seller In My',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        SizedBox(
          height: 10,
        ),
        //////////////////////////////////////////////////
        BookRating(mainAxisAlignment: MainAxisAlignment.center, bookRate: 00 , rate: 00 ,),
        SizedBox(
          height: 10,
        ),
        BookAction(),
        Expanded(child: SizedBox(height: 40)),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'There Is Similar Book',
            style: Styles.textStyle16,
           
          ),
        ),
        SizedBox(height: 20),
        SimilarBookListView(),
SizedBox(height: 40,)
      ]),
    );
  }
}
