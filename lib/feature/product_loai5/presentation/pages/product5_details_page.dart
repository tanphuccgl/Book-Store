import 'dart:developer';

import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/injection_container.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/cart/presentation/pages/cart_page.dart';
import 'package:book_store/feature/product/data/models/product_data.dart';
import 'package:book_store/feature/product/presentation/pages/kind_of_book_page.dart';
import 'package:book_store/feature/product/presentation/widgets/header_kind_of_book.dart';
import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:book_store/feature/product/presentation/widgets/search_bar_kind_of_book.dart';
import 'package:book_store/feature/product_loai1/presentation/manager/product1_bloc.dart';
import 'package:book_store/feature/product_loai1/presentation/widget/appbar_product_loa1.dart';
import 'package:book_store/feature/product_loai1/presentation/widget/body_product1_details.dart';
import 'package:book_store/feature/product_loai3/presentation/manager/product3_bloc.dart';
import 'package:book_store/feature/product_loai3/presentation/widget/body_product3_details.dart';
import 'package:book_store/feature/product_loai5/presentation/manager/product5_bloc.dart';
import 'package:book_store/feature/product_loai5/presentation/widget/body_product5_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Product5DetailPage extends StatefulWidget {
  static const String routeName = '/Product5DetailPage';



  const Product5DetailPage({Key key}) : super(key: key);

  @override
  _Product5DetailPageState createState() => _Product5DetailPageState();
}

class _Product5DetailPageState extends State<Product5DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarProductLoai(context: context),
        body: Padding(
          padding: EdgeInsets.only(left: 25,  right: 25),
          child: Column(
            children: [
              header(context: context,title:"Tủ sách sống khác" ,onPressed2: (){ Navigator.pushNamed(context, PageRoutes.cartPage);}),
              searchBarKindOfBook(context: context,),
              _buildBody(context)
            ],
          ),
        ));
  }
  BlocProvider<Product5Bloc> _buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<Product5Bloc>(),
        child: Expanded(
          child: Stack(children: [
            BodyProduct5Detail(),
          ],


          ),
        )
    );
  }
}
