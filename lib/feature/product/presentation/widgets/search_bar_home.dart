import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/presentation/pages/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget searchBarHome({BuildContext context}) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SearchPage()));
    },
    child: Stack(
      children: [
        Container(
          width: size.width/1.2,
          height: size.width/7.2,
          decoration: BoxDecoration(
              border: Border.all(color: kPrimaryOrangeColor),
              color: Colors.white,
              borderRadius: BorderRadius.circular(29.5)),
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: size.width/72),
              child: Text(
                "      Search Book...",style: TextStyle(color: kPrimaryGrayColor),
                textAlign: TextAlign.start,
              )),
          padding: EdgeInsets.symmetric(horizontal: size.width/12, vertical: size.width/72),
        ),
        Positioned(
            left: 0,
            bottom: -7,
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: kPrimaryOrangeColor,
              ),
            )),
      ],
    ),
  );
}
