import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/sign_in/presentation/pages/sign_in_page.dart';
import 'package:book_store/feature/sign_up/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routeName = '/OnBoardingPage';
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Container(
                    child: _title(title: "Book For"),
                    padding: EdgeInsets.only(bottom: 10, top: 100),
                  ),
                  Container(
                    child: _title(title: "Every Taste"),
                    padding: EdgeInsets.only(bottom: 50),
                  ),
                  Container(
                    child: _button(
                      title: "Sign In",
                      onPressed: () {
                       Navigator.pushNamed(context, PageRoutes.signIn);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: _button(
                      title: "Sign Up",
                      onPressed: () {
                        Navigator.pushNamed(context, PageRoutes.signUp);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: -120,
            child: Image.asset(
              "assets/images/a3.png",
              height: size.height/2,
              width: size.width/1.028571428571429,
            ),
          ),
        ],
      ),
    );
  }

  Widget _title({String title}) {
    return Text(
      title,
      style: TextStyle(
          color: kPrimaryOrangeColor,
          fontSize: 30,
          fontWeight: FontWeight.w700),
    );
  }

  Widget _button({String title, Function onPressed}) {
    Size size= MediaQuery.of(context).size;

    return SizedBox(
      height: size.height/12.8,
      width: size.width/1.285714285714286,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: kPrimaryOrangeColor,
      ),
    );
  }
}
