import 'package:book_store/feature/product/presentation/widgets/search_bar_home.dart';
import 'package:flutter/material.dart';

Widget searchBarKindOfBook({BuildContext context}) {
  Size size = MediaQuery.of(context).size;
  return Container(
    child: searchBarHome(context: context),
    width: size.width,
    height: size.height/16.41025641025641,
    margin: EdgeInsets.only(top: 5, bottom: 15),
  );
}