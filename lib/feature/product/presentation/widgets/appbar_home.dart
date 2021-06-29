import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/presentation/widgets/search_bar_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarHome({BuildContext context}) {
  Size size = MediaQuery
      .of(context)
      .size;
  return AppBar(
    elevation: 0,leading: Icon(Icons.arrow_back,color: Colors.red,size: 1,),
    flexibleSpace: Container(
      width: size.width,
      height: size.height/16.4102564102564,
      margin: EdgeInsets.only(left: 25, right: 25, top: 18),
      child: searchBarHome(context: context),
    ),

    backgroundColor: Colors.transparent,
    bottom: TabBar(
      // labelPadding: EdgeInsets.all(0),
      // indicatorPadding: EdgeInsets.all(0),
      isScrollable: true,
      labelColor: kPrimaryOrangeColor,
      unselectedLabelColor: kPrimaryGrayColor,
      tabs: [
        _tab(title: "New"),
        _tab(title: "Favourite"),
        _tab(title: "Evaluate"),

      ],
    ),
  );
}
Widget _tab({String title}){
  return Tab(
    child: Container(
      margin: EdgeInsets.only(right: 30),
      child: Text(title),
    ),
  );

}