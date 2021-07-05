import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/cart/presentation/pages/cart_page.dart';
import 'package:book_store/feature/chat/presentation/pages/chat_page.dart';
import 'package:book_store/feature/forgot_pass/presentation/pages/forgot_pass_page.dart';
import 'package:book_store/feature/forgot_pass/presentation/pages/forgot_pass_page2.dart';
import 'package:book_store/feature/onboarding/pages/onboading_page.dart';
import 'package:book_store/feature/onboarding/pages/onboarding_screen.dart';
import 'package:book_store/feature/product/presentation/pages/home_page.dart';
import 'package:book_store/feature/product/presentation/pages/kind_of_book_page.dart';
import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:book_store/feature/product_loai1/presentation/pages/product1_details_page.dart';
import 'package:book_store/feature/product_loai2/presentation/pages/product2_details_page.dart';
import 'package:book_store/feature/product_loai3/presentation/pages/product3_details_page.dart';
import 'package:book_store/feature/product_loai4/presentation/pages/product4_details_page.dart';
import 'package:book_store/feature/product_loai5/presentation/pages/product5_details_page.dart';
import 'package:book_store/feature/product_loai6/presentation/pages/product6_details_page.dart';
import 'package:book_store/feature/product_loai7/presentation/pages/product7_details_page.dart';
import 'package:book_store/feature/profile/data/models/profile_data.dart';
import 'package:book_store/feature/profile/presentation/pages/about_us_page.dart';
import 'package:book_store/feature/profile/presentation/pages/carted_page.dart';
import 'package:book_store/feature/profile/presentation/pages/change_pw_page.dart';
import 'package:book_store/feature/profile/presentation/pages/change_theme_page.dart';
import 'package:book_store/feature/profile/presentation/pages/my_account_page1.dart';
import 'package:book_store/feature/profile/presentation/pages/profile_page.dart';
import 'package:book_store/feature/profile/presentation/pages/settings_page.dart';
import 'package:book_store/feature/profile/presentation/widgets/change_theme.dart';
import 'package:book_store/feature/sign_in/data/models/login_data.dart';

import 'package:book_store/feature/sign_in/presentation/pages/sign_in_page.dart';
import 'package:book_store/feature/sign_up/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_store/core/utils/injection_container.dart' as di;



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  int initScreen;
  prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  runApp(MyApp(initScreen: initScreen,));
}

SharedPreferences prefs;
LoginData appUser;
ProfileData appProfile;

class MyApp extends StatefulWidget {
  final int initScreen;

  const MyApp({Key key, this.initScreen}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            home: OnboardingScreen(),
            initialRoute: widget.initScreen == 0 || widget.initScreen == null
                ? PageRoutes.onBoardingScreen
                : PageRoutes.onBoardingPage,
            routes: {
              PageRoutes.onBoardingPage: (context) => OnBoardingPage(),
              PageRoutes.onBoardingScreen: (context) => OnboardingScreen(),
              PageRoutes.signIn: (context) => SignInPage(),
              PageRoutes.signUp: (context) => SignUpPage(),
              PageRoutes.forgotPassPage: (context) => ForgotPassPage(),
              PageRoutes.homePage: (context) => HomePage(),
              PageRoutes.productDetail: (context) => ProductDetail(),
              PageRoutes.cartPage: (context) => CartPage(),
              PageRoutes.kindOfBookPage: (context) => KindOfBookPage(),
              PageRoutes.chatPage: (context) => ChatPage(),
              PageRoutes.profilePage: (context) => ProfilePage(),
              PageRoutes.myAccountPage: (context) => MyAccountPage1(),
              PageRoutes.product1DetailPage: (context) => Product1DetailPage(),
              PageRoutes.product2DetailPage: (context) => Product2DetailPage(),
              PageRoutes.product3DetailPage: (context) => Product3DetailPage(),
              PageRoutes.product4DetailPage: (context) => Product4DetailPage(),
              PageRoutes.product5DetailPage: (context) => Product5DetailPage(),
              PageRoutes.product6DetailPage: (context) => Product6DetailPage(),
              PageRoutes.product7DetailPage: (context) => Product7DetailPage(),
              PageRoutes.alertDialog1: (context) => AlertDialog1(),
              PageRoutes.settingsPage: (context) => SettingsPage(),
              PageRoutes.changePwPage: (context) => ChangePwPage(),
              PageRoutes.forgotPassPage2: (context) => ForgotPassPage2(),
              PageRoutes.cartedPage: (context) => CartedPage(),
              PageRoutes.changeThemePage: (context) => ChangeThemePage(),
              PageRoutes.aboutUsPage: (context) => AboutUsPage(),

            },
          );
        },
      );
}
