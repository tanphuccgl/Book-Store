import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/product/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

Widget appBarCart({BuildContext context,String item}) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: kPrimaryOrangeColor,
      ),
      onPressed: () {
       Navigator.pop(context);
      },
    ),
    title: Column(
      children: [
        Text(
          "Your Cart",
          style: TextStyle(),
        ),
        Text(
         item,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    ),
  );
}
