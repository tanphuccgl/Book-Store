
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/injection_container.dart';
import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/onboarding/pages/onboading_screen.dart';
import 'package:book_store/feature/sign_in/presentation/manager/login_bloc.dart';
import 'package:book_store/feature/sign_in/presentation/widgets/appbar_sign_in.dart';
import 'package:book_store/feature/sign_in/presentation/widgets/body_login.dart';
import 'package:book_store/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = '/SignInPage';
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: appBarSignIn(context: context),
      body: buildBody(context),
    );
  }

  BlocProvider<LoginBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),

      child: BodyLogin()
    );
  }
}
