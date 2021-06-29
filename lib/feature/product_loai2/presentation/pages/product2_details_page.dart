import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/injection_container.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/cart/presentation/pages/cart_page.dart';

import 'package:book_store/feature/product/presentation/pages/kind_of_book_page.dart';
import 'package:book_store/feature/product/presentation/widgets/header_kind_of_book.dart';
import 'package:book_store/feature/product/presentation/widgets/search_bar_kind_of_book.dart';
import 'package:book_store/feature/product_loai1/presentation/widget/appbar_product_loa1.dart';

import 'package:book_store/feature/product_loai2/presentation/manager/product2_bloc.dart';
import 'package:book_store/feature/product_loai2/presentation/widget/body_product2_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Product2DetailPage extends StatefulWidget {
  static const String routeName = '/Product2DetailPage';

  const Product2DetailPage({Key key}) : super(key: key);

  @override
  _Product2DetailPageState createState() => _Product2DetailPageState();
}

class _Product2DetailPageState extends State<Product2DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarProductLoai(context: context),
        body: Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              header(
                  context: context,
                  title: "Skycomics",
                  onPressed2: () {
                    Navigator.pushReplacementNamed(
                        context, PageRoutes.cartPage);
                  }),
              searchBarKindOfBook(
                context: context,
              ),
              _buildBody(context)
            ],
          ),
        ));
  }

  BlocProvider<Product2Bloc> _buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<Product2Bloc>(),
        child: Expanded(
          child: Stack(
            children: [
              BodyProduct2Detail(),
            ],
          ),
        ));
  }
}
