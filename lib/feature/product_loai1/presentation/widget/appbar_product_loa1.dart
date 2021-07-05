import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/product/presentation/pages/kind_of_book_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarProductLoai({BuildContext context}){
  return AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: kPrimaryOrangeColor,
      ),
      onPressed: () {
      Navigator.pop(context);
      },
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
  );

}