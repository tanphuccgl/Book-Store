import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/onboarding/pages/onboading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarSignIn({BuildContext context})
{
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: kPrimaryOrangeColor,
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, PageRoutes.onBoardingPage);
      },
    ),
    backgroundColor: Colors.transparent,
  );
}