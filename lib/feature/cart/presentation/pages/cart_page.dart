import 'dart:developer';

import 'package:book_store/core/api/api_cart.dart';
import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/get_current_user.dart';
import 'package:book_store/core/utils/injection_container.dart';
import 'package:book_store/feature/cart/data/models/cart_response_model.dart';
import 'package:book_store/feature/cart/presentation/manager/cart_bloc.dart';
import 'package:book_store/feature/cart/presentation/widgets/body_cart.dart';
import 'package:book_store/feature/product/data/models/product_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatefulWidget {
  static const String routeName = '/CartPage';
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartResponseModel cartResponseModel;
  http.Client client = http.Client();

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
      body: BodyCart(
        cartResponseModel: cartResponseModel,
        onRefreshCart: () {
          ApiCart.getData().then((value1) {
            setState(() {
              cartResponseModel = value1;
              print(cartResponseModel.tongTienthanhtoan);
            });
          });
        },
      ),
    );
  }

  Future<bool> putIsStatus({
    @required String idProduct,
  }) async {
    final response = await client.put(
      "$mainUrl/product/changepayment/$idProduct",
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        'auth-token': '${getCurrentUser().token}',
        // k co header la failed 415
      },
    );
    log("Put Status Product:" + "$mainUrl/product/changepayment/$idProduct");
    log("Response Status Put Product: ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw ServerException();
    }
  }
}
