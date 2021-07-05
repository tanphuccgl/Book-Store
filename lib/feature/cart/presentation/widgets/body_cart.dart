import 'dart:developer';

import 'package:book_store/core/api/api_cart.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:book_store/core/utils/loading_widget.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:book_store/feature/cart/data/models/cart_data.dart';
import 'package:book_store/feature/cart/data/models/cart_response_model.dart';
import 'package:book_store/feature/cart/presentation/manager/cart_bloc.dart';
import 'package:book_store/feature/cart/presentation/manager/cart_event.dart';
import 'package:book_store/feature/cart/presentation/manager/cart_state.dart';
import 'package:book_store/feature/cart/presentation/pages/cart_page.dart';
import 'package:book_store/feature/cart/presentation/widgets/app_bar_cart.dart';

import 'package:book_store/feature/cart/presentation/widgets/bottom_cart.dart';
import 'package:book_store/feature/cart/presentation/widgets/item_card.dart';
import 'package:book_store/feature/product/data/models/product_data.dart';
import 'package:book_store/feature/product/presentation/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';

class BodyCart extends StatefulWidget {
  final CartResponseModel cartResponseModel;
  final Function() onRefreshCart;

  const BodyCart({Key key, this.cartResponseModel, this.onRefreshCart})
      : super(key: key);

  @override
  _BodyCartState createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
  bool _checkBox;
  CartResponseModel cartResponseModel1;

  String tong;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkBox = false;
    cartResponseModel1 = widget.cartResponseModel;
    tong = "0";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return widget.cartResponseModel != null
        ? Scaffold(
            bottomNavigationBar: bottomCart(
              total:'${price.format(int.parse(tong))}' ?? "0",
              onPressed1: () {},
              onPressed: () {

                postPayment();
                showSuccess();
              },
            ),
            appBar: appBarCart(
                context: context,
                item: "${int.parse(widget.cartResponseModel.tongSanpham)}"),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ItemCart(
                    data: widget.cartResponseModel.cart[index],
                    onDelete: () => onDelete(
                        amount: widget.cartResponseModel.cart[index].amount,
                        id: widget.cartResponseModel.cart[index].sId),
                    onCong: () => congSanPham(
                        id: widget.cartResponseModel.cart[index].sId,
                        amount: widget.cartResponseModel.cart[index].amount,
                        tongSanPham: widget.cartResponseModel.tongSanpham,
                        function: () {
                          setState(() {
                            int a =
                                int.parse(widget.cartResponseModel.tongSanpham);
                            a++;
                            widget.cartResponseModel.tongSanpham = a.toString();

                          });

                        },
                        function1: () {
                          int a = int.parse(
                                  widget.cartResponseModel.cart[index].amount) +
                              1;

                          widget.cartResponseModel.cart[index].amount =
                              a.toString();
                          putProduct(
                              idProduct:
                                  widget.cartResponseModel.cart[index].sId,
                              amount: a.toString());
                          ApiCart.getData().then((value1) {
                            setState(() {
                              widget.cartResponseModel.tongTienthanhtoan = value1.tongTienthanhtoan;
                            });
                            tong = widget.cartResponseModel.tongTienthanhtoan;
                            print("1 " + tong.toString());
                          });

                          Future.delayed(Duration(milliseconds: 500), () {
                            print("2 " + tong.toString());
                          });
                        }),
                    onTru: () => truSanPham(
                        amount: widget.cartResponseModel.cart[index].amount,
                        id: widget.cartResponseModel.cart[index].sId,
                        tongSanPham: widget.cartResponseModel.tongSanpham,
                        function: () {
                          setState(() {
                            int a =
                                int.parse(widget.cartResponseModel.tongSanpham);
                            a--;
                            widget.cartResponseModel.tongSanpham = a.toString();
                          });
                        },
                        function1: () {
                          int a = int.parse(
                                  widget.cartResponseModel.cart[index].amount) -
                              1;

                          widget.cartResponseModel.cart[index].amount =
                              a.toString();
                          putProduct(
                              idProduct:
                                  widget.cartResponseModel.cart[index].sId,
                              amount: a.toString());
                          ApiCart.getData().then((value1) {
                            setState(() {
                              widget.cartResponseModel.tongTienthanhtoan = value1.tongTienthanhtoan;
                            });
                            tong = widget.cartResponseModel.tongTienthanhtoan;
                            print("1 " + tong.toString());
                          });

                          Future.delayed(Duration(milliseconds: 500), () {
                            print("2 " + tong.toString());
                          });
                        }),
                    onPressedCheck: () => onPressedCheck(
                        id: widget.cartResponseModel.cart[index].sId),
                  );
                },
                itemCount: widget.cartResponseModel.cart.length,
              ),
            ),
          )
        : Center(
            child: SpinkitLoading(),
          );
  }

  void onPressedCheck({
    String id,
  }) {
    setState(() {
      putIsStatus(idProduct: id);

      // _show = !_show;

      //   widget.onRefreshCart();
      ApiCart.getData().then((value1) {
        setState(() {
          widget.cartResponseModel.tongTienthanhtoan = value1.tongTienthanhtoan;
        });
        tong = widget.cartResponseModel.tongTienthanhtoan;
        print("1 " + tong.toString());
      });

      Future.delayed(Duration(milliseconds: 500), () {
        print("2 " + tong.toString());
      });
    });
  }

  void onDelete({String id, String amount}) {
    setState(() {
      deleteProduct(idProduct: id);
      amount = "0";
      showDelete();
    });
  }

  void onChangeCheckBox(bool value) {}

  void getCart() {
    BlocProvider.of<CartBloc>(context).add(GetCartE());
  }

  Widget _imageProduct(String url) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: SizedBox(
        width: size.width / 4.090909090909091,
        child: AspectRatio(
          aspectRatio: 0.88,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(url),
          ),
        ),
      ),
    );
  }

  Widget _nameProduct(String tenSach) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        width: size.width / 1.8,
        child: Text(
          tenSach,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _priceProduct(String giaBia) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text.rich(
        TextSpan(
          text: "₫${price.format(int.parse(giaBia))}",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _decrement({Function onPressed}) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: size.height / 16,
            width: size.width / 9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 6),
                  blurRadius: 10,
                  color: Color(0xFFB0B0B0).withOpacity(0.2),
                ),
              ],
            ),
            child: FlatButton(
              padding: EdgeInsets.zero,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: onPressed,
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }

  Widget _increment({Function onPressed}) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: size.height / 16,
            width: size.width / 9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 6),
                  blurRadius: 10,
                  color: Color(0xFFB0B0B0).withOpacity(0.2),
                ),
              ],
            ),
            child: FlatButton(
              padding: EdgeInsets.zero,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: onPressed,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void showSuccess() {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => AlertDialog1(
    //             title: "SUCCESS",
    //             description: "Payment success",
    //             onPressed: () {
    //               Navigator.pushReplacementNamed(context, PageRoutes.cartPage);
    //             },
    //             image: "done")));

    var alert = new AlertDialog1(
      image: "done",
      title: "SUCCESS",
      description: "Payment success",
      onPressed: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, PageRoutes.cartPage);
      },
    );
    showDialog(
        context: context,barrierDismissible: false,
        builder: (context) {
          return alert;
        });
  }

  void showDelete() {
    var alert = new AlertDialog1(
      image: "done",
      title: "SUCCESS",
      description: "Successful delete",
      onPressed: () {
        setState(() {
          Navigator.pushReplacementNamed(context, PageRoutes.cartPage);
        });
      },
    );
    showDialog(
        context: context, barrierDismissible: false,
        builder: (context) {
          return alert;
        });
  }

  void congTongSanPham({String tongSanPham}) {
    setState(() {
      int a = int.parse(tongSanPham);
      a++;
      tongSanPham = a.toString();
    });
  }

  void truTongSanPham({String truSanPham}) {
    setState(() {
      int a = int.parse(truSanPham);
      a--;
      truSanPham = a.toString();
    });
  }

  void congSanPham(
      {String amount,
      String id,
      String tongSanPham,
      Function function,
      Function function1}) {
    setState(() {
      function();

      // int b = int.parse(tongSanPham);
      // b++;
      // tongSanPham = b.toString();
      //   congTongSanPham(tongSanPham: tongSanPham);
      // _totalProduct++;
      // print(_totalProduct);
      function1();
      // int a = int.parse(amount) + 1;
      //
      // amount = a.toString();
      // putProduct(idProduct: id, amount: a.toString());
    });
  }

  void truSanPham(
      {String amount,
      String id,
      String tongSanPham,
      Function function,
      Function function1}) {
    // setState(() {
    //   int a = int.parse(tongSanPham);
    //   a--;
    //   tongSanPham = a.toString();
    // });

    setState(() {
      function();
      function1();
      // int b = int.parse(tongSanPham);
      // b--;
      // tongSanPham = b.toString();

      // _totalProduct--;
      // print(_totalProduct);

      //   truTongSanPham(truSanPham: tongSanPham);

      int a = int.parse(amount) - 1;

      amount = a.toString();
      putProduct(idProduct: id, amount: a.toString());
    });
  }
}
