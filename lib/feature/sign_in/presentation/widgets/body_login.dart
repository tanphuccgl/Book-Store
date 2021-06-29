import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/get_current_user.dart';
import 'package:book_store/core/utils/key.dart';
import 'package:book_store/core/utils/loading_widget.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/forgot_pass/presentation/pages/forgot_pass_page.dart';
import 'package:book_store/feature/product/presentation/pages/home_page.dart';
import 'package:book_store/feature/profile/presentation/widgets/change_theme.dart';
import 'package:book_store/feature/sign_in/presentation/manager/login_bloc.dart';
import 'package:book_store/feature/sign_in/presentation/manager/login_event.dart';
import 'package:book_store/feature/sign_in/presentation/manager/login_state.dart';
import 'package:book_store/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({Key key}) : super(key: key);

  @override
  _BodyLoginState createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  String email;
  String pass;
  final emailText = TextEditingController();
  final passText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool _checkBox = true;
    bool _isVisible = true;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is Empty) {
          isLogin();
        } else if (state is LoginAlready) {
          appUser = getCurrentUser();
          inHome();
        } else if (state is Loaded) {
          appUser = state.data;
          inHome();
        } else if (state is Loading) {
          return SpinkitLoading();
        } else if (state is Error) {
          return Stack(children: [
            Container(
              height: size.height,
              width: size.width,
              padding: EdgeInsets.only(top: 20, right: 15, left: 15),
              child: Column(
                children: [
                  title(title: "Sign In"),
                  _inputEmail(
                      controller: emailText,
                      onChanged: (value) {
                        clear;
                        email = value;
                      },
                      hintText: "Email Address"),
                  _inputPass(
                      controller: passText,
                      onChanged: (value) {
                        clear;
                        pass = value;
                      },
                      hintText: "Password",
                      obscureText: _isVisible),
                  _failed(),
                  _stayAndForgot(
                    value1: _checkBox,

                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, PageRoutes.forgotPassPage);
                    },
                  ),
                  _button(
                    onPressed: () {
                      if (email != null && pass != null) {
                        return login();
                      } else {
                        return clear();
                      }
                    },
                  ),
                  SizedBox(
                    height: size.height / 21.33333333333333,
                  ),
                  Text(
                    "Or",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: size.height / 42.66666666666667,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset(
                            'assets/icons/facebook.png',
                            height: size.height / 21.33333333333333,
                            width: size.width / 12,
                          )),
                      FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset(
                            'assets/icons/google.png',
                            height: size.height / 21.33333333333333,
                            width: size.width / 12,
                          )),
                      FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset(
                            'assets/icons/twitter.png',
                            height: size.height / 21.33333333333333,
                            width: size.width / 12,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ]);
        } else if (state is NotLogin) {
          return Stack(children: [
            Container(
              height: size.height,
              width: size.width,
              padding: EdgeInsets.only(top: 20, right: 15, left: 15),
              child: Column(
                children: [
                  title(title: "Sign In"),
                  _inputEmail(
                      controller: emailText,
                      onChanged: (value) {
                        clear;
                        email = value;
                      },
                      hintText: "Email Address"),
                  _inputPass(
                      controller: passText,
                      onChanged: (value) {
                        clear;
                        pass = value;
                      },
                      hintText: "Password",
                      obscureText: _isVisible),
                  _stayAndForgot(
                    value1: _checkBox,

                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, PageRoutes.forgotPassPage);
                    },
                  ),
                  _button(
                    onPressed: () {
                      if (email != null && pass != null) {
                        return login();
                      } else {
                        Scaffold.of(context).showSnackBar(new SnackBar(
                          content: Text('Please complete all information'),
                        ));
                        return clear();
                      }
                    },
                  ),
                  SizedBox(
                    height: size.height / 21.33333333333333,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: size.height / 128,
                        width: size.width / 7.2,
                        decoration: BoxDecoration(
                            color: kPrimaryOrangeColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        width: size.width / 36,
                      ),
                      Text(
                        "Social Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: size.width / 36,
                      ),
                      Container(
                        height: size.height / 128,
                        width: size.width / 7.2,
                        decoration: BoxDecoration(
                            color: kPrimaryOrangeColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 42.66666666666667,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset(
                            'assets/icons/facebook.png',
                            height: size.height / 16,
                            width: size.width / 9,
                          )),
                      FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset(
                            'assets/icons/google.png',
                            height: size.height / 16,
                            width: size.width / 9,
                          )),
                      FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset(
                            'assets/icons/twitter.png',
                            height: size.height / 16,
                            width: size.width / 9,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ]);
        }
        return Container();
      },
    );
  }

  void inHome() {
    Future.delayed(Duration.zero, () async {
      Navigator.pushReplacementNamed(context, PageRoutes.homePage);
    });
  }

  void login() {
    BlocProvider.of<LoginBloc>(context).add(LoginE(email, pass));
  }

  void isLogin() {
    BlocProvider.of<LoginBloc>(context).add(IsLogin());
  }

  void clear() {
    BlocProvider.of<LoginBloc>(context).add(ClearE());
  }

  Widget _inputEmail(
      {TextEditingController controller, Function onChanged, String hintText}) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 40, left: 10),
      child: Row(
        children: [
          SizedBox(
            height: size.height / 10.66666666666667,
            width: size.width / 1.161290322580645,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: TextStyle(color: kPrimaryBlackColor),
              maxLines: 1,
              obscureText: false,
              // keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: (hintText),
                hintStyle: TextStyle(
                    color: kPrimaryGrayColor, fontWeight: FontWeight.w500),
                border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25)),
              ),
              textInputAction: TextInputAction.done,
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputPass(
      {TextEditingController controller,
      Function onChanged,
      String hintText,
      bool obscureText}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 20, left: 10),
      child: Row(
        children: [
          SizedBox(
            height: size.height / 10.66666666666667,
            width: size.width / 1.161290322580645,
            child: StatefulBuilder(
              builder: (context, setState) {
                return TextField(
                  controller: controller,
                  onChanged: onChanged,
                  style: TextStyle(color: kPrimaryBlackColor),
                  maxLines: 1,
                  obscureText: obscureText,
                  // keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          child: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kPrimaryOrangeColor,
                          ),
                          onTap: () => {
                            setState(() {
                              obscureText = !obscureText;
                            })
                          },
                        )),
                    contentPadding: EdgeInsets.all(20),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: (hintText),
                    hintStyle: TextStyle(
                        color: kPrimaryGrayColor, fontWeight: FontWeight.w500),
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
    );
  }

  Widget _stayAndForgot({bool value1,  Function onPressed}) {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                StatefulBuilder(
                  builder: (context, setState) => Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    checkColor: Colors.white,
                    activeColor: kPrimaryOrangeColor,
                    value: value1,
                    onChanged: (value) {
                      setState(() {

                        value1 = value;
                      });
                    },
                  ),
                ),
                Container(
                  child: Text(
                    "Stay Logged In",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                "Forgotten Password?",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _button({Function onPressed}) {
    Size size = MediaQuery.of(context).size;
    return Padding(
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
        child: RaisedButton(
          elevation: 0,
          onPressed: onPressed,
          child: Text(
            "Sign In",
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
    );
  }
}

Widget _failed() {
  return Container(
    child: Row(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "Login failed. Email or password does not match!",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ))
      ],
    ),
  );
}

Widget title({String title}) {
  return Container(
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
              color: kPrimaryBlackColor,
              fontSize: 25,
              fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}
