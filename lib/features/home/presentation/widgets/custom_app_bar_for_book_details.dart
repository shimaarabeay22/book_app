import 'package:flutter/material.dart';

class CustomAppBarForBookDetails extends StatelessWidget {
  const CustomAppBarForBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          Spacer(),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
    );
  }
}
