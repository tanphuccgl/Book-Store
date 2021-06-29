import 'package:book_store/core/api/api_cart.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/cart/data/models/cart_response_model.dart';
import 'package:book_store/feature/cart/data/models/carted_data.dart';
import 'package:book_store/feature/product/presentation/widgets/header_kind_of_book.dart';
import 'package:book_store/feature/profile/presentation/widgets/body_carted.dart';
import 'package:flutter/material.dart';

class CartedPage extends StatefulWidget {
  static const String routeName = '/CartedPage';

  const CartedPage({Key key}) : super(key: key);

  @override
  _CartedPageState createState() => _CartedPageState();
}

class _CartedPageState extends State<CartedPage> {
  CartResponseModel cartResponseModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiCart.getData().then((value) {
      setState(() {
        cartResponseModel = value;
      });
    });
  }

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
                    Navigator.pushReplacementNamed(
                        context, PageRoutes.profilePage);
                  },
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: header(
                  context: context,
                  title: "Purchase Order",
                  onPressed2: () {
                    setState(() {
                      Navigator.pushReplacementNamed(context, PageRoutes.cartPage);
                    });
                  },
                )),
          ],
        ),
        BodyCarted(cartResponseModel: cartResponseModel,),
      ],
    ));
  }
}
