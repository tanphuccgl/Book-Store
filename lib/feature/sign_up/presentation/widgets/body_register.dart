import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:book_store/core/utils/loading_widget.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/core/utils/terms_of_service.dart';
import 'package:book_store/feature/onboarding/pages/onboarding_screen.dart';
import 'package:book_store/feature/sign_in/data/models/login_data.dart';
import 'package:book_store/feature/sign_in/presentation/pages/sign_in_page.dart';
import 'package:book_store/feature/sign_in/presentation/widgets/body_login.dart';
import 'package:book_store/feature/sign_up/presentation/manager/register_bloc.dart';
import 'package:book_store/feature/sign_up/presentation/manager/register_event.dart';
import 'package:book_store/feature/sign_up/presentation/manager/register_state.dart';
import 'package:book_store/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyRegister extends StatefulWidget {
  const BodyRegister({Key key}) : super(key: key);

  @override
  _BodyRegisterState createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  final ScrollController _controller = new ScrollController();

  bool a = false;
  String name;
  String email;
  String pass;
  String confirmPass;

  var reachEnd = false;

  _listener() {
    final maxScroll = _controller.position.maxScrollExtent;
    final minScroll = _controller.position.minScrollExtent;
    if (_controller.offset >= maxScroll) {
      setState(() {
        reachEnd = true;
      });
    }

    if (_controller.offset <= minScroll) {
      setState(() {
        reachEnd = false;
      });
    }
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool _checkBox = false;
    bool _isVisible = true;
    bool _isVisible1 = true;
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      if (state is Empty) {
        return Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.only(top: 30, right: 15, left: 15),
          child: Column(
            children: [
              title(title: "Sign Up"),
              _inputName(
                onChange: (value) {
                  clear;
                  name = value;
                },
              ),
              _inputEmail(
                onChange: (value) {
                  clear;
                  email = value;
                },
              ),
              _inputPass(
                onChange: (value) {
                  clear;
                  pass = value;
                },
                obscureText: _isVisible,
              ),
              _inputConfirmPass(
                onChange: (value) {
                  clear;
                  confirmPass = value;
                },
                obscureText: _isVisible1,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          StatefulBuilder(
                            builder: (context, setState) => Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              checkColor: Colors.white,
                              activeColor: kPrimaryOrangeColor,
                              value: _checkBox,
                              onChanged: (value) {
                                setState(() {
                                  _checkBox = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            child: Text(
                              "Please agree to the terms of use",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: size.width / 72,
                          ),
                          Container(
                            child: TextButton(
                              child: Text(
                                "Read me",
                                style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              onPressed: () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Stack(
                                          overflow: Overflow.visible,
                                          children: <Widget>[
                                            Form(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: size.height / 32,
                                                      child: Scrollbar(
                                                        controller: _controller,
                                                        isAlwaysShown: true,
                                                        child: ListView.builder(
                                                          controller:
                                                              _controller,
                                                          itemCount:
                                                              termsOfService
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Text(
                                                                termsOfService[
                                                                    index]);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: CircleAvatar(
                                                      backgroundColor:
                                                          kPrimaryOrangeColor,
                                                      child: Icon(
                                                        Icons.arrow_downward,
                                                        color:
                                                            kPrimaryWhiteColor,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      _controller.animateTo(
                                                          _controller.position
                                                              .maxScrollExtent,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  1000),
                                                          curve: Curves
                                                              .fastOutSlowIn);
                                                    },
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: RaisedButton(
                                                          color:
                                                              kPrimaryOrangeColor,
                                                          child: Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                                color:
                                                                    kPrimaryWhiteColor),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: RaisedButton(
                                                          color:
                                                              kPrimaryOrangeColor,
                                                          child: Text(
                                                            "Accpet",
                                                            style: TextStyle(
                                                                color:
                                                                    kPrimaryWhiteColor),
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            });
                                                          },
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _button(
                onPressed: () {
                  if (pass == confirmPass &&
                      _checkBox == true &&
                      pass != null &&
                      name != null &&
                      email != null &&
                      confirmPass != null) {
                    return register();
                  } else {
                    if (pass != confirmPass) {
                      Scaffold.of(context).showSnackBar(
                          new SnackBar(content: Text('Password incorrect')));
                    }
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: Text('Please complete all information'),
                    ));
                    return clear();
                  }
                },
              ),
            ],
          ),
        );
      } else if (state is Loaded) {
        return AlertDialog1(
          image: "done",
          title: "Succes",
          description: "Account successfully created",
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, PageRoutes.onBoardingPage);
          },
        );
      } else if (state is Loading) {
        return SpinkitLoading();
      } else if (state is Error) {}
      return Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(top: 30, right: 15, left: 15),
        child: Column(
          children: [
            title(title: "Sign Up"),
            _inputName(
              onChange: (value) {
                clear;
                name = value;
              },
            ),
            _inputEmail(
              onChange: (value) {
                clear;
                email = value;
              },
            ),
            _inputPass(
              onChange: (value) {
                clear;
                pass = value;
              },
              obscureText: _isVisible,
            ),
            _inputConfirmPass(
              onChange: (value) {
                clear;
                confirmPass = value;
              },
              obscureText: _isVisible1,
            ),
            _failed(),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        StatefulBuilder(
                          builder: (context, setState) => Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            checkColor: Colors.white,
                            activeColor: kPrimaryOrangeColor,
                            value: _checkBox,
                            onChanged: (value) {
                              setState(() {
                                _checkBox = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          child: Text(
                            "Please agree to the terms of use",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: size.width / 72,
                        ),
                        Container(
                          child: TextButton(
                            child: Text(
                              "Read me",
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Stack(
                                        overflow: Overflow.visible,
                                        children: <Widget>[
                                          Form(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Expanded(
                                                  child: SizedBox(
                                                    height: size.height / 32,
                                                    child: Scrollbar(
                                                      controller: _controller,
                                                      isAlwaysShown: true,
                                                      child: ListView.builder(
                                                        controller: _controller,
                                                        itemCount:
                                                            termsOfService
                                                                .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Text(
                                                              termsOfService[
                                                                  index]);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: CircleAvatar(
                                                    backgroundColor:
                                                        kPrimaryOrangeColor,
                                                    child: Icon(
                                                      Icons.arrow_downward,
                                                      color: kPrimaryWhiteColor,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    _controller.animateTo(
                                                        _controller.position
                                                            .maxScrollExtent,
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        curve: Curves
                                                            .fastOutSlowIn);
                                                  },
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: RaisedButton(
                                                        color:
                                                            kPrimaryOrangeColor,
                                                        child: Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                              color:
                                                                  kPrimaryWhiteColor),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: RaisedButton(
                                                        color:
                                                            kPrimaryOrangeColor,
                                                        child: Text(
                                                          "Accpet",
                                                          style: TextStyle(
                                                              color:
                                                                  kPrimaryWhiteColor),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _button(
              onPressed: () {
                return register();
              },
            ),
          ],
        ),
      );
    });
  }

  void register() {
    BlocProvider.of<RegisterBloc>(context).add(RegisterE(name, email, pass));
  }

  void clear() {
    BlocProvider.of<RegisterBloc>(context).add(ClearE());
  }

  Widget _inputName({Function onChange}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 40, left: 10),
      child: Row(
        children: [
          SizedBox(
            height: size.height / 10.66666666666667,
            width: size.width / 1.161290322580645,
            child: TextFormField(
              onChanged: onChange,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,

              maxLines: 1,
              obscureText: false,
              // keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: ("First & Last Name"),
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

  Widget _inputEmail({Function onChange}) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 20, left: 10),
      child: Row(
        children: [
          SizedBox(
            height: size.height / 10.66666666666667,
            width: size.width / 1.161290322580645,
            child: TextFormField(
              onChanged: onChange,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,

              maxLines: 1,
              obscureText: false,
              // keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: ("Email Address"),
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

  Widget _inputPass({Function onChange, bool obscureText}) {
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
                  onChanged: onChange,
                  style: TextStyle(color: Colors.black),
                  maxLines: 1,
                  obscureText: obscureText,
                  // keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
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
                    hintText: ("Password"),
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
            "Sign Up",
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

  Widget _inputConfirmPass({Function onChange, bool obscureText}) {
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
                  onChanged: onChange,
                  style: TextStyle(color: Colors.black),
                  maxLines: 1,
                  obscureText: obscureText,
                  // keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
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
                    hintText: ("Confirm Password"),
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

  Widget _failed() {
    return Container(
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Register failed. Invalid name, email or password!",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ))
        ],
      ),
    );
  }
}
