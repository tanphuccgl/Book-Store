import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:book_store/core/utils/injection_container.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/product/presentation/widgets/header_kind_of_book.dart';
import 'package:book_store/feature/product_loai1/presentation/widget/appbar_product_loa1.dart';
import 'package:book_store/feature/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:book_store/feature/profile/presentation/manager/profile_bloc.dart';
import 'package:book_store/feature/profile/presentation/pages/profile_page.dart';
import 'package:book_store/feature/profile/presentation/widgets/body_my_account.dart';
import 'package:book_store/feature/profile/presentation/widgets/body_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: kPrimaryOrangeColor,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, PageRoutes.profilePage);
                  },
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: header(context: context, title: "Edit Profile")),
          ],
        ),
       _buildBody(context),
      ],
    ));
  }
  BlocProvider<ProfileBloc> _buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<ProfileBloc>(),
        child: Expanded(
          child: Stack(children: [
            BodyMyAccount(),
          ],


          ),
        )
    );
  }


}
