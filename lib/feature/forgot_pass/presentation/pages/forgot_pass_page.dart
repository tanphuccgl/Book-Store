import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/forgot_pass/presentation/widgets/body_forgot_pass.dart';
import 'package:book_store/feature/sign_in/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

class ForgotPassPage extends StatefulWidget {
  static const String routeName = '/ForgotPassPage';
  const ForgotPassPage({Key key}) : super(key: key);

  @override
  _ForgotPassPageState createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryOrangeColor,
          ),
          onPressed: () {
            // Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, PageRoutes.signIn);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: BodyForgotPass(),
    );
  }
}
