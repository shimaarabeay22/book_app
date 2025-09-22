import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {

final MainAxisAlignment mainAxisAlignment;

  const BookRating({super.key, required this.mainAxisAlignment, required this.bookRate, required this.rate});
  final num bookRate;
  final num rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 18,),
        SizedBox(width: 5,),
        Text("$rate",style: Styles.textStyle16),
        const SizedBox(
          width: 5,
        ),
        Text('($bookRate)',
            style: Styles.textStyle14.copyWith(
                color: Color(0xff707070), fontWeight: FontWeight.w600))
      ],
    );
  }
}