import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/onboarding/widgets/bottom_sheet_onboarding.dart';
import 'package:book_store/feature/onboarding/widgets/page_view_onboarding.dart';
import 'package:book_store/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/OnBoardingScreen';
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  Widget _indicator(bool isActive) {
    Size size= MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: size.height/80,//8.0,
      width: size.width/45,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryGrayColor : kPrimaryOrangeColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: size.height/1.163636363636364,//550
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      pageViewOnboarding(
                          title1: "VAULE",context: context,
                          title2: "Here at Book Store, we know"
                              "everyone loves a good bargain. That\'s why we have made it our"
                              "mission to offer you a huge selection of book at fantastic",
                          image: "assets/images/a1.png"),
                      pageViewOnboarding(
                          title1: "PRODUCT",context: context,
                          title2:
                              "The books we sell are new, unread, and in good condition",
                          image: "assets/images/a2.png"),
                      pageViewOnboarding(
                          title1: "SERVICE",context: context,
                          title2: "We believe that being the bestseller"
                              "in bargain books is about much more than providing you with great selection and value",
                          image: "assets/images/a4.png"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? _continuePage()
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? bottomSheetOnboarding(context)
          : Text(''),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _continuePage() {
    Size size= MediaQuery.of(context).size;

    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomRight,
        child: FlatButton(
          onPressed: () {
            _pageController.nextPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Next',
                style: TextStyle(
                  color: kPrimaryOrangeColor,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(width: size.width/36),
              Icon(
                Icons.arrow_forward,
                color: kPrimaryOrangeColor,
                size: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
