import 'package:book_store/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget searchBarHome({BuildContext context}){

  return  Stack(
    children: [
      Container(
        decoration: BoxDecoration(border: Border.all(color: kPrimaryOrangeColor),
            color: Colors.white,
            borderRadius: BorderRadius.circular(29.5)),
        child: TextField(
          maxLengthEnforced: true,style: TextStyle(color: kPrimaryGrayColor),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  left: 19, top: 30, bottom: 5),
              border: InputBorder.none,
              hintText: "Search book...",hintStyle: TextStyle(color: kPrimaryGrayColor)),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 30, vertical: 5),
      ),
      Positioned(
          left: 0,
          bottom: -4,
          child: IconButton(
            icon: Icon(Icons.search,color: kPrimaryOrangeColor,),
          )),
    ],
  );
}