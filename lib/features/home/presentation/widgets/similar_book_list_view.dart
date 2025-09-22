import 'package:flutter/material.dart';

import 'custom_image.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*.15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Padding(
              /////////////////////////////////////////////////////////
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child:CustomBookImage (image:'' ,),
            );
          }),
    );
  }
}