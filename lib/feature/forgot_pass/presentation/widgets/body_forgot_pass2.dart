import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/forgot_pass/data_sources/forgot_pw_remote_data_source.dart';
import 'package:book_store/feature/forgot_pass/presentation/widgets/body_forgot_pass.dart';
import 'package:book_store/feature/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';

class BodyForgotPass2 extends StatefulWidget {
  final String email;

  const BodyForgotPass2({Key key, this.email}) : super(key: key);

  @override
  _BodyForgotPass2State createState() => _BodyForgotPass2State();
}

class _BodyForgotPass2State extends State<BodyForgotPass2> {
  String confirmPw;
  String pass;
  String code;
  final confirmPwText = TextEditingController();
  final passText = TextEditingController();
  final codeText = TextEditingController();

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
                    "Verification Codes",
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
                      controller: codeText,
                      onChanged: (value) {
                        code = value;
                      },
                      style: TextStyle(color: kPrimaryBlackColor),
                      maxLines: 1,
                      obscureText: false,
                      // keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: ("Code"),
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
            Container(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Row(
                children: [
                  SizedBox(
                    height: size.height / 10.66666666666667,
                    width: size.width / 1.161290322580645,
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return TextField(
                          controller: passText,
                          onChanged: (value) {
                            pass = value;
                          },
                          style: TextStyle(color: kPrimaryBlackColor),
                          maxLines: 1,
                          obscureText: _isVisible,
                          // keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffixIcon: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  child: Icon(
                                    _isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: kPrimaryOrangeColor,
                                  ),
                                  onTap: () => {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    })
                                  },
                                )),
                            contentPadding: EdgeInsets.all(20),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: ("Password New"),
                            hintStyle: TextStyle(
                                color: kPrimaryGrayColor,
                                fontWeight: FontWeight.w500),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          textInputAction: TextInputAction.done,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Row(
                children: [
                  SizedBox(
                    height: size.height / 10.66666666666667,
                    width: size.width / 1.161290322580645,
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return TextField(
                          controller: confirmPwText,
                          onChanged: (value) {
                            confirmPw = value;
                          },
                          style: TextStyle(color: kPrimaryBlackColor),
                          maxLines: 1,
                          obscureText: _isVisible,
                          // keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffixIcon: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  child: Icon(
                                    _isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: kPrimaryOrangeColor,
                                  ),
                                  onTap: () => {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    })
                                  },
                                )),
                            contentPadding: EdgeInsets.all(20),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: ("Confirm New Password"),
                            hintStyle: TextStyle(
                                color: kPrimaryGrayColor,
                                fontWeight: FontWeight.w500),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          textInputAction: TextInputAction.done,
                        );
                      },
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
                      if (
                          code != null &&

                          pass != null &&
                          confirmPw == pass &&

                          confirmPw != null) {
                        putNewPw(
                            email: widget.email,
                            token: code,
                            newPassword: pass,
                            function: () {
                              showSuccess();
                            },
                            function2: () {
                              showCancel();
                            });
                      } else {
                        if(pass!=confirmPw)
                        {
                          Scaffold.of(cxt).showSnackBar(new SnackBar(
                              content: Text('Password incorrect') ));
                        }
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
                        side: BorderSide(color: kPrimaryOrangeColor, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    color: kPrimaryOrangeColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  void showCancel() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "ERROR",
      description: "Invalid information",
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
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);

        Navigator.pushReplacementNamed(context, PageRoutes.onBoardingPage);
      },
    );
    showDialog(
        context: context,barrierDismissible: false,
        builder: (context) {
          return alert;
        });
  }
}
