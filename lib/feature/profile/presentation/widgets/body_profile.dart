import 'package:book_store/core/api/api_profile.dart';
import 'package:book_store/core/api/api_view_avt.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog2.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/cart/presentation/pages/cart_page.dart';
import 'package:book_store/feature/onboarding/pages/onboading_page.dart';
import 'package:book_store/feature/onboarding/pages/onboarding_screen.dart';
import 'package:book_store/feature/product/presentation/widgets/header_kind_of_book.dart';
import 'package:book_store/feature/profile/data/models/profile_response_model.dart';
import 'package:book_store/feature/profile/presentation/pages/my_account_page1.dart';
import 'package:book_store/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({Key key}) : super(key: key);

  @override
  _BodyProfileState createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  ProfileResponseModel data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiProfile.getData().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return data != null
        ? Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            Center(child: _buildImage()),
            Positioned(
              top: 0,
              right: 0,
              child: header(
                  context: context,
                  title: '',
                  onPressed: () {},
                  onPressed2: () {
                    setState(() {
                      Navigator.pushNamed(
                          context, PageRoutes.cartPage);
                    });
                  }),
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            _buildMenu(
              title: "My Account",
              icon: "assets/icons/user.png",
              onPress: () =>
              {
                Navigator.pushNamed(
                    context, PageRoutes.myAccountPage)
              },
            ),
            _buildMenu(
              title: "Purchase Order",
              icon: "assets/icons/oder.png",
              onPress: () =>
              {
                Navigator.pushNamed(context, PageRoutes.cartedPage)
              },
            ),
            _buildMenu(
              title: "Settings",
              icon: "assets/icons/settings.png",
              onPress: () =>
              {
                Navigator.pushNamed(context, PageRoutes.settingsPage)
              },
            ),
            _buildMenu(
              title: "About Us",
              icon: "assets/icons/help.png",
              onPress: () =>{
                Navigator.pushNamed(context, PageRoutes.aboutUsPage)
              },
            ),
            _buildMenu(
              title: "Log Out",
              icon: "assets/icons/logout.png",
              onPress: () {
                AlertDialog2.yesAbortDialog(
                    context: context,
                    title: "EXIT",
                    body: "Do you want to sign out?", onPressed: () {
                  logout();
                  Navigator.pushNamedAndRemoveUntil(context, PageRoutes.onBoardingPage,(Route<dynamic> route) => false);


                });
              },
            ),
          ],
        ),
      ),
    ])
        : Center(
      child: SpinkitLoading(),
    );
  }

  Widget _buildImage() {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
      height: size.height / 5.565217391304348,
      width: size.width / 3.130434782608696,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          data.data.imagePerson != null
              ? CircleAvatar(backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(data?.data?.imagePerson ??
                "https://www.freeiconspng.com/uploads/red-circular-image-error-0.png"),
          )
              : SpinkitLoading(),

        ],
      ),
    );
  }

  Widget _buildMenu({String title, String icon, Function onPress}) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: kPrimaryOrangeColor,
        onPressed: onPress,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: size.width / 16.36363636363636,
            ),
            SizedBox(width: size.width / 18),
            Expanded(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white),
                )),
            Icon(
              Icons.arrow_forward_ios,
              color: kPrimaryWhiteColor,
            ),
          ],
        ),
      ),
    );
  }

  void logout() {
    prefs.setString(SAVE_LOGIN_RESPONSE, '');
  }
}
