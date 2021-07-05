import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/key.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/chat/presentation/pages/chat_page.dart';
import 'package:book_store/feature/product/presentation/pages/home_page.dart';
import 'package:book_store/feature/product/presentation/pages/kind_of_book_page.dart';
import 'package:book_store/feature/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int index;

  const BottomBar({Key key, this.index}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    switch (index) {
      case 0:
        try {
          Navigator.pushNamedAndRemoveUntil(context, PageRoutes.homePage,(Route<dynamic> route) => false);
      //    Navigator.pushReplacementNamed(context, PageRoutes.homePage);
        } catch (e) {
          print(e.toString());
        }
        break;
      case 1:
        Navigator.pushNamedAndRemoveUntil(context, PageRoutes.kindOfBookPage,(Route<dynamic> route) => false);

      //  Navigator.pushReplacementNamed(context, PageRoutes.kindOfBookPage);
        break;
      case 2:
        Navigator.pushNamedAndRemoveUntil(context, PageRoutes.chatPage,(Route<dynamic> route) => false);

     //   Navigator.pushReplacementNamed(context, PageRoutes.chatPage);
        break;

      case 3:
        Navigator.pushNamedAndRemoveUntil(context, PageRoutes.profilePage,(Route<dynamic> route) => false);

       // Navigator.pushReplacementNamed(context, PageRoutes.profilePage);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: kPrimaryOrangeColor,
                spreadRadius: 1,
                offset: Offset(-0.1, 0),
                blurRadius: 2),
          ],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          )),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Trang chủ')),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), title: Text('Danh mục')),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline), title: Text('Chat')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), title: Text('Cá nhân')),
          ],
          currentIndex: widget.index != null ? widget.index : selectedIndex,
          selectedItemColor: kPrimaryOrangeColor,
          onTap: onItemTapped,
          backgroundColor: Colors.white,
          unselectedItemColor: kPrimaryGrayColor,
        ),
      ),
    );
  }
}
