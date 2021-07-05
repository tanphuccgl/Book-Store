import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/loading_widget.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/cart/presentation/pages/cart_page.dart';
import 'package:book_store/feature/product/presentation/manager/product_bloc.dart';
import 'package:book_store/feature/product/presentation/manager/product_event.dart';
import 'package:book_store/feature/product/presentation/manager/product_state.dart';
import 'package:book_store/feature/product/presentation/pages/best_sell_page_view.dart';
import 'package:book_store/feature/product/presentation/pages/evaluate_page_view.dart';
import 'package:book_store/feature/product/presentation/pages/favourite_page_view.dart';
import 'package:book_store/feature/product/presentation/pages/new_page_view.dart';
import 'package:book_store/feature/product/presentation/pages/search_bar.dart';
import 'package:book_store/feature/product/presentation/widgets/appbar_home.dart';
import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key key}) : super(key: key);

  @override
  _BodyHomeState createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  final GlobalKey<ScaffoldState> favouriteKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> newKey = GlobalKey<ScaffoldState>();

  final ScrollController newController = ScrollController();
  final ScrollController favoutiteController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is Empty) {
        getProduct();
      } else if (state is Loading) {
        return SpinkitLoading();
      } else if (state is Loaded) {
        return ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 25,
                            color: kPrimaryOrangeColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.notifications_active_outlined,
                              color: kPrimaryOrangeColor),
                          onPressed: () {

                          }),
                      IconButton(
                          icon: Icon(Icons.shopping_cart_outlined,
                              color: kPrimaryOrangeColor),
                          onPressed: () {
                            setState(() {
                              Navigator.pushNamed(
                                  context, PageRoutes.cartPage);
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: size.height / 1.828571428571429,
              margin: EdgeInsets.only(top: 0),
              padding: EdgeInsets.only(left: 0),
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: appBarHome(context: context),
                  body: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      height: size.height / 1.828571428571429,
                      child: TabBarView(
                        children: [
                          pageNew(
                              context: context,
                              list5: state.data,
                              key: newKey,
                              controller: newController),
                          pageFavourite(
                              context: context,
                              list4: state.data,
                              key: favouriteKey,
                              controller: favoutiteController),
                          pageEvaluate(context: context, list: state.data),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Best Sell',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryOrangeColor),
                  )
                ],
              ),
            ),
            pageBestSell(context: context, list: state.data),
          ],
        );
      } else if (state is Error) {
        return Text("tam thoi khong hoat dong");
      }
      return Container();
    });
  }

  void getProduct() {
    BlocProvider.of<ProductBloc>(context).add(GetProductE());
  }
}
