import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:flutter/material.dart';

class ChangePwPage extends StatefulWidget {
  static const String routeName = '/ChangePwPage';

  const ChangePwPage({Key key}) : super(key: key);

  @override
  _ChangePwPageState createState() => _ChangePwPageState();
}

class _ChangePwPageState extends State<ChangePwPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String newPw;
  String oldPw;
  String confirmPw;
  final newPwText = TextEditingController();
  final oldPwText = TextEditingController();
  final confirmPwText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _isVisible = true;
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryOrangeColor,
          ),
          onPressed: () {
             Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
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
                      "Change The Password",
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
                        controller: oldPwText,
                        onChanged: (value) {
                          oldPw = value;
                        },
                        style: TextStyle(color: kPrimaryBlackColor),
                        maxLines: 1,
                        obscureText: false,
                        // keyboardType: TextInputType.newPwAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: ("Old Password"),
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
                            controller: newPwText,
                            onChanged: (value) {
                              newPw = value;
                            },
                            style: TextStyle(color: kPrimaryBlackColor),
                            maxLines: 1,
                            obscureText: _isVisible,
                            // keyboardType: TextInputType.newPwAddress,
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
                                    onTap: () =>
                                    {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      })
                                    },
                                  )),
                              contentPadding: EdgeInsets.all(20),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: ("New Password"),
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
                            // keyboardType: TextInputType.newPwAddress,
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
                                    onTap: () =>
                                    {
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
                  child:Builder(builder: (cxt)=> RaisedButton(
                    elevation: 0,
                    onPressed: () {
                      if (oldPw != null && newPw == confirmPw &&
                          newPw != null &&
                          confirmPw != null &&
                          newPw.length != 0 && confirmPw.length != 0 &&
                          oldPw.length != 0) {
                        putChangePw(password: oldPw, newPassword: newPw,function: (){
                          showSuccess();
                        },function1: (){
                          showCancel();
                        });
                      } else {
                        if(newPw!=confirmPw)
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
                        side: BorderSide(
                            color: kPrimaryOrangeColor, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    color: kPrimaryOrangeColor,
                  ),)
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void showCancel() {
    var alert = new AlertDialog1(image: "cancel",
      title: "ERROR",
      description: "Password change failed",
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

        Navigator.pushReplacementNamed(context, PageRoutes.settingsPage);
      },
    );
    showDialog(
        context: context,barrierDismissible: false,
        builder: (context) {
          return alert;
        });
  }
}
