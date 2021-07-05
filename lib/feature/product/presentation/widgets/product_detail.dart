import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/cart/data/data_sources/cart_remote_data_source.dart';

import 'package:book_store/feature/cart/presentation/widgets/body_cart.dart';
import 'package:book_store/feature/product/data/models/product_data.dart';
import 'package:book_store/feature/product/presentation/widgets/header_kind_of_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatefulWidget {
  static const String routeName = '/ProductDetail';
  final ProductData data;

  ProductDetail({@required this.data});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isClick = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      widget.data.amount = "1";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String sachLoai1 = "Skybooks";
    String sachLoai2 = "Skycomics";
    String sachLoai3 = "Skynovel";
    String sachLoai4 = "Skymommy";
    String sachLoai5 = "Tủ sách sống khác";
    String sachLoai6 = "Tủ sách chữa lành";
    String sachLoai7 = "Tủ sách quý cô";
    if (widget.data.loaisach == "loai1") {
      widget.data.loaisach = sachLoai1;
    } else if (widget.data.loaisach == "loai2") {
      widget.data.loaisach = sachLoai2;
    } else if (widget.data.loaisach == "loai3") {
      widget.data.loaisach = sachLoai3;
    } else if (widget.data.loaisach == "loai4") {
      widget.data.loaisach = sachLoai4;
    } else if (widget.data.loaisach == "loai5") {
      widget.data.loaisach = sachLoai5;
    } else if (widget.data.loaisach == "loai6") {
      widget.data.loaisach = sachLoai6;
    } else if (widget.data.loaisach == "loai7") {
      widget.data.loaisach = sachLoai7;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: size.height/3.764705882352941,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 8,
                            blurRadius: 12,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(
                        bottom: 20,
                        top: 30,
                      ),
                      child: Hero(
                        tag: widget.data.sId,
                        child: Image.network(
                          widget.data.urlImage,
                          fit: BoxFit.fitHeight,
                          scale: 1.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Positioned(
                      left: 1,
                      top: 10,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: kPrimaryOrangeColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          widget.data.amount = "1";
                        },
                      ),
                    ),
                  ),
                  Positioned(
                      top: 10,
                      right: -10,
                      child: header(
                          context: context,
                          title: "",
                          onPressed2: () {
                            Navigator.pushNamed(
                                context, PageRoutes.cartPage);
                          })),
                ],
              ),
              SizedBox(
                height: size.height/64,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      width: size.width/4.5,
                      height: size.height/16,
                      child: Text(
                        "Book title: ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      )),
                  Container(
                    height: size.height/12.8,
                    width: size.width/1.44,
                    child: Text(
                      widget.data.tenSach,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(

                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      width: size.width/4.5,
                      height: size.height/16,
                      child: Text(
                        "Author: ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      )),
                  Container(
                    height: size.height/16,
                    width: size.width/1.44,
                    child: Text(
                      widget.data.tacGia,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                          color: kPrimaryGrayColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      width: size.width/4.5,
                      height: size.height/32,
                      child: Text(
                        "Category: ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      )),
                  widget.data.theLoai.isEmpty
                      ? Container(
                          height: size.height/32,
                          width: size.width/1.44,
                          child: Text(
                            "Không có dữ liệu !",
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 15, color: kPrimaryBlueColor),
                            textAlign: TextAlign.start,
                          ),
                        )
                      : Container(
                          height: size.height/32,
                          width: size.width/1.44,
                          child: Text(
                            widget.data.theLoai,
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      width: size.width/4.5,
                      height: size.height/32,
                      child: Text(
                        "Kind book: ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      )),
                  widget.data.loaisach.isEmpty
                      ? Container(
                          height: size.height/32,
                          width: size.width/1.44,
                          child: Text(
                            "Không có dữ liệu !",
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              color: kPrimaryBlueColor,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                      : Container(
                    height: size.height/32,
                    width: size.width/1.44,
                          child: Text(
                            widget.data.loaisach,
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      height: size.height/32,
                      width: size.width/4.5,
                      child: Text(
                        "Format: ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      )),
                  widget.data.khoSach.isEmpty
                      ? Container(
                    height: size.height/32,
                    width: size.width/1.44,
                          child: Text(
                            "Không có dữ liệu !",
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              color: kPrimaryBlueColor,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                      : Container(
                    height: size.height/32,
                    width: size.width/1.44,
                          child: Text(
                            widget.data.khoSach,
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      height: size.height/32,
                      width: size.width/4.5,
                      child: Text(
                        "NXB : ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      )),
                  widget.data.nxb.isEmpty
                      ? Container(
                    height: size.height/32,
                    width: size.width/1.44,
                          child: Text(
                            "Không có dữ liệu !",
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              color: kPrimaryBlueColor,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                      : Container(
                    height: size.height/32,
                    width: size.width/1.44,
                          child: Text(
                            widget.data.nxb,
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      height: size.height/32,
                      width: size.width/4.5,
                      child: Text(
                        "Release: ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      )),
                  widget.data.phathanhthang.isEmpty
                      ? Container(
                    height: size.height/32,
                    width: size.width/1.44,
                          child: Text(
                            "Không có dữ liệu !",
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              color: kPrimaryBlueColor,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                      : Container(
                    height: size.height/32,
                    width: size.width/1.44,
                          child: Text(
                            widget.data.phathanhthang,
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange.shade700, size: 20),
                      Icon(Icons.star, color: Colors.orange.shade700, size: 20),
                      Icon(Icons.star, color: Colors.orange.shade700, size: 20),
                      Icon(Icons.star, color: Colors.orange.shade700, size: 20),
                      Icon(Icons.star_border,
                          color: Colors.orange.shade700, size: 20),
                      SizedBox(
                        width: size.width/72,
                      ),
                      Text(
                        "4.0",
                        style: TextStyle(
                            color: Colors.orange.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      SizedBox(
                        width: size.width/72,
                      ),
                      Text(
                        "(1341)",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  OutlineButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    borderSide:
                        BorderSide(width: 3, color: kPrimaryOrangeColor),
                    child: Text(
                      "₫${price.format(int.parse(widget.data.giaBia))}",
                      style: TextStyle(
                        color: kPrimaryOrangeColor,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(
                height: size.height/64,
              ),
              Divider(
                thickness: 1.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: size.width/36,
                    ),
                    Text(
                      widget.data.yeuThich,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      " Likes",
                      style: TextStyle(fontSize: 12, ),
                    ),
                    SizedBox(
                      width: size.width/12,
                    ),
                    Icon(Icons.message),
                    SizedBox(
                      width: size.width/36,
                    ),
                    Text(
                      "0",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(" Comments",
                        style: TextStyle(fontSize: 12, )),
                    SizedBox(
                      width: size.width/12,
                    ),
                    Icon(Icons.share),
                    Text("  Share",
                        style: TextStyle(
                          fontSize: 12,

                        ))
                  ],
                ),
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: size.height/64,
              ),
              Text(
                "About the book",
                style: TextStyle(

                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height/64,
              ),
              Text(
                widget.data.moTa,
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),
              SizedBox(
                height: size.height/21.33333333333333,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: size.width/2.769230769230769,
                      child: SizedBox(
                        width: double.infinity,
                        height: size.height/11.42857142857143,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: kPrimaryOrangeColor,
                          onPressed: () {
                            showCancel();
                          },
                          child: Text(
                            "Chat With The Store",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                      width: size.width/2.769230769230769,
                      child: SizedBox(
                        width: double.infinity,
                        height: size.height/11.42857142857143,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: kPrimaryOrangeColor,
                          onPressed: () {
                            addProduct(
                                idProduct: widget.data.sId,
                                amount: "1",
                                function: () {
                                  showSuccess();
                                });
                          },
                          child: Text(
                            "Add Cart",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSuccess() {
    var alert = new AlertDialog1(
      image: "done",
      title: "SUCCESS",
      description: "Added to cart",
      onPressed: () {
        Navigator.pop(context);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void showCancel() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "ERROR",
      description: "Functions in development",
      onPressed: () {
        Navigator.pop(context);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
