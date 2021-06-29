import 'dart:developer';

import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/injection_container.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/cart/presentation/pages/cart_page.dart';
import 'package:book_store/feature/product/presentation/manager/product_bloc.dart';
import 'package:book_store/feature/product/presentation/manager/product_event.dart';
import 'package:book_store/feature/product/presentation/manager/product_state.dart';
import 'package:book_store/feature/product/presentation/widgets/header_kind_of_book.dart';
import 'package:book_store/feature/product/presentation/widgets/search_bar_home.dart';
import 'package:book_store/feature/product/presentation/widgets/search_bar_kind_of_book.dart';
import 'package:book_store/feature/product_loai1/presentation/pages/product1_details_page.dart';
import 'package:book_store/feature/product/presentation/widgets/bottom_bar.dart';
import 'package:book_store/feature/product_loai1/presentation/manager/product1_bloc.dart';
import 'package:book_store/feature/product_loai2/presentation/pages/product2_details_page.dart';
import 'package:book_store/feature/product_loai3/presentation/pages/product3_details_page.dart';
import 'package:book_store/feature/product_loai4/presentation/pages/product4_details_page.dart';
import 'package:book_store/feature/product_loai5/presentation/pages/product5_details_page.dart';
import 'package:book_store/feature/product_loai6/presentation/pages/product6_details_page.dart';
import 'package:book_store/feature/product_loai7/presentation/pages/product7_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KindOfBookPage extends StatefulWidget {
  static const String routeName = '/KindOfBookPage';
  const KindOfBookPage({Key key}) : super(key: key);

  @override
  _KindOfBookPageState createState() => _KindOfBookPageState();
}

class _KindOfBookPageState extends State<KindOfBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        index: 1,
      ),
      body: _buildBody(context: context),
    );
  }

  Widget _buildBody({BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(left: 25, top: 40, right: 25),
      child: Column(
        children: [
          header(context: context,title:'Kind of Book' ,onPressed: (){},onPressed2: () {
            setState(() {
              Navigator.pushReplacementNamed(context, PageRoutes.cartPage);
            });
          }),
          searchBarKindOfBook(context: context),
          _gridView(context: context),
        ],
      ),
    );
  }





  Widget _itemGridView({String title, String image, Function onTap,BuildContext context}) {
    Size size= MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 17),
                color: Colors.black.withOpacity(0.2),
                blurRadius: 17,
                spreadRadius: -23)
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                image,
                height: size.height/6.4,
                width: size.width/3.6,
              ),
              Spacer(),
              Text(title,style: TextStyle(color: kPrimaryGrayColor),)
            ],
          ),
        ),
      ),
    );
  }

  Widget _gridView({BuildContext context}) {
    return Expanded(
        child: GridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 15),
      childAspectRatio: 1,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        _itemGridView(context: context,
          title: "Skybooks",
          image: "assets/images/a5.png",
          onTap: () {
            Navigator.pushReplacementNamed(context, PageRoutes.product1DetailPage);
          },
        ),
        _itemGridView(
          title: "Skycomics",context: context,
          image: "assets/images/a6.png",
          onTap: () {
            Navigator.pushReplacementNamed(context, PageRoutes.product2DetailPage);
          },
        ),
        _itemGridView(
          title: "Skynovel",context: context,
          image: "assets/images/a7.png",
          onTap: () {
            Navigator.pushReplacementNamed(context, PageRoutes.product3DetailPage);
          },
        ),
        _itemGridView(
          title: "Skymommy",context: context,
          image: "assets/images/a8.png",
          onTap: () {
            Navigator.pushReplacementNamed(context, PageRoutes.product4DetailPage);
          },
        ),
        _itemGridView(
          title: "Tủ sách sống khác",context: context,
          image: "assets/images/a9.png",
          onTap: () {
            Navigator.pushReplacementNamed(context, PageRoutes.product5DetailPage);
          },
        ),
        _itemGridView(
          title: "Tủ sách chữa lành",context: context,
          image: "assets/images/a10.png",
          onTap: () {
            Navigator.pushReplacementNamed(context, PageRoutes.product6DetailPage);
          },
        ),
        _itemGridView(
          title: "Tủ sách quý cô",context: context,
          image: "assets/images/a11.png",
          onTap: () {
            Navigator.pushReplacementNamed(context, PageRoutes.product7DetailPage);
          },
        ),
      ],
    ));
  }
}
