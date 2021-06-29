import 'package:book_store/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';


Widget pageViewOnboarding({String title1, String title2, String image,BuildContext context}) {
  Size size= MediaQuery.of(context).size;

  return Padding(
    padding: EdgeInsets.all(40.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          child: Center(
            child: Text(
              title1,
              style: TextStyle(
                  color: kPrimaryOrangeColor,
                  fontFamily: 'CM Sans Serif',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700

                  // height: 1.5,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          padding: EdgeInsets.only(top: 30),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Center(
            child: Text(
              title2,
              style: TextStyle(
                color: kPrimaryOrangeColor,
                fontSize: 11.0,
                //  height: 1.2,
              ),textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 40),
          child: Image.asset(
            image,
            width: size.width /1.2,
            height: size.height/2.133333333333333,
          ),
        ),
      ],
    ),
  );
}
