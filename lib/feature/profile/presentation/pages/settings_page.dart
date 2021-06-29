import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = '/SettingsPage';

  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
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
                    Navigator.pushReplacementNamed(
                        context, PageRoutes.profilePage);
                  },
                ),
              ],
            ),
          ],
        ),
        Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                Row(children: [
                  Container(
                    child: Text(
                      "Settings",
                      style: TextStyle(
                          color: kPrimaryOrangeColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ]),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: size.height/10.66666666666667,
                  decoration: BoxDecoration(
                      color: kPrimaryOrangeColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: kPrimaryBlackColor)),
                  child: ListTile(
                    leading: Icon(
                      Icons.send,
                      color: kPrimaryWhiteColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryWhiteColor,
                    ),
                    title: Text(
                      "Change the password",
                      style: TextStyle(
                        color: kPrimaryWhiteColor,fontWeight: FontWeight.bold
                      ),
                    ),
                    onTap: () {   Navigator.pushReplacementNamed(context, PageRoutes.changePwPage);},
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: size.height/10.66666666666667,
                  decoration: BoxDecoration(
                      color: kPrimaryOrangeColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: kPrimaryBlackColor)),
                  child: ListTile(
                    leading: Icon(
                      Icons.send,
                      color: kPrimaryWhiteColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryWhiteColor,
                    ),
                    title: Text(
                      "Theme",
                      style: TextStyle(
                        color: kPrimaryWhiteColor,fontWeight: FontWeight.bold
                      ),
                    ),
                    onTap: () {   Navigator.pushReplacementNamed(context, PageRoutes.changeThemePage);},
                  ),
                ),
              ],
            )),
      ],
    ));
  }
}
