import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/onboarding/pages/onboading_screen.dart';
import 'package:book_store/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bottomSheetOnboarding(BuildContext context){
  Size size= MediaQuery.of(context).size;

  return Container(
    height: size.height/6.4,
    width: double.infinity,
    color: Colors.transparent,
    child: GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, PageRoutes.onBoardingPage);
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.0),
          child: Text(
            'Get started',
            style: TextStyle(
              color: kPrimaryOrangeColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}