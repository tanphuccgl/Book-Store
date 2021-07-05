import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/injection_container.dart';
import 'package:book_store/feature/onboarding/pages/onboading_page.dart';
import 'package:book_store/feature/sign_in/presentation/widgets/appbar_sign_in.dart';
import 'package:book_store/feature/sign_up/presentation/manager/register_bloc.dart';
import 'package:book_store/feature/sign_up/presentation/widgets/body_register.dart';
import 'package:book_store/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/SignUpPage';
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSignIn(context: context),
      body: _buildBody(context),
    );
  }
  BlocProvider<RegisterBloc> _buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<RegisterBloc>(),
        child: Stack(children: [
          BodyRegister()
        ],)
    );
  }

}
