import 'package:book_store/feature/product/presentation/widgets/bottom_bar.dart';
import 'package:book_store/feature/profile/presentation/widgets/body_profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/ProfilePage';
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BodyProfile(),
      bottomNavigationBar: BottomBar(index: 3,),
    );
  }
}
