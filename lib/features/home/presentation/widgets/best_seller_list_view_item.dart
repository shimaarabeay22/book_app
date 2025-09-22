import 'package:book_app/features/home/presentation/widgets/book_rating.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookName, required this.authorName, required this.image, required this.price, required this.rate1, required this.bookRate});
 final String bookName;
  final String authorName;
 final String image;
 final num  price ;
 final num rate1;
 final num bookRate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.8 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.red,
                image: DecorationImage(
                    image: AssetImage(AssetsData.testImage), fit: BoxFit.fill),
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                Text(
                  bookName,
                  style: Styles.textStyle20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 3,
                ),
               Text(
                  authorName,
                  style: Styles.textStyle16,
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                     '$price',
                      style: Styles.textStyle18
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    BookRating(mainAxisAlignment: MainAxisAlignment.start, bookRate:bookRate, rate: rate1,)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
