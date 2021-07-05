import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/forgot_pass/data_sources/forgot_pw_remote_data_source.dart';
import 'package:book_store/feature/forgot_pass/presentation/pages/forgot_pass_page2.dart';
import 'package:book_store/feature/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class BodyForgotPass extends StatefulWidget {
  const BodyForgotPass({Key key}) : super(key: key);

  @override
  _BodyForgotPassState createState() => _BodyForgotPassState();
}

class _BodyForgotPassState extends State<BodyForgotPass> {
  static String email;

  final emailText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _isVisible = true;
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(top: 20, right: 15, left: 15),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    "Forgot Password",
                    style: TextStyle(

                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40, left: 10),
              child: Row(
                children: [
                  SizedBox(
                    height: size.height / 10.66666666666667,
                    width: size.width / 1.161290322580645,
                    child: TextField(
                      controller: emailText,
                      onChanged: (value) {
                        email = value;
                      },
                      style: TextStyle(color: kPrimaryBlackColor),
                      maxLines: 1,
                      obscureText: false,
                       keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: ("Email Address"),
                        hintStyle: TextStyle(
                            color: kPrimaryGrayColor,
                            fontWeight: FontWeight.w500),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                  height: size.height / 12.8,
                  width: size.width / 1.161290322580645,
                  decoration: BoxDecoration(
                      color: kPrimaryOrangeColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: kPrimaryOrangeColor.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(1, 4),
                        ),
                      ]),
                  child: Builder(
                    builder: (cxt) => RaisedButton(
                      elevation: 0,
                      onPressed: () {
                        if ( email != null) {
                          postForgotPw(
                              email: email,
                              function: () {
                                Navigator.pushReplacement(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => ForgotPassPage2(
                                              email: email,
                                            )));
                              },
                              function2: () {
                                showCancel();
                              });
                        } else {
                          Scaffold.of(cxt).showSnackBar(new SnackBar(
                            content: Text('Please complete all information'),
                          ));
                        }
                      },
                      child: Text(
                        "Accept",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Netflix",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          letterSpacing: 0.0,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: kPrimaryOrangeColor, width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      color: kPrimaryOrangeColor,
                    ),
                  )),
            ),
          ],
        ),
      ),
    ]);
  }

  void showCancel() {
    var alert = new AlertDialog1(
      image: "404",
      title: "ERROR",
      description: "The system is maintenance",
      onPressed: () {
        Navigator.pop(context);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void showSuccess() {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => AlertDialog1(
    //             title: "SUCCESS",
    //             description: "Payment success",
    //             onPressed: () {
    //               Navigator.pushReplacementNamed(context, PageRoutes.cartPage);
    //             },
    //             image: "done")));

    var alert = new AlertDialog1(
      image: "done",
      title: "SUCCESS",
      description: "Change password successfully",
      onPressed: () {
        Navigator.pushReplacementNamed(context, PageRoutes.forgotPassPage2);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
