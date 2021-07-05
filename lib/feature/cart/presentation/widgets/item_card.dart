import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:book_store/feature/cart/data/models/cart_response_model.dart';
import 'package:book_store/feature/product/data/models/product_data.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final ProductData data;
  final Function onPressedCheck;
  final Function onDelete;
  final Function onCong;
  final Function onTru;
  final bool isShow;

  const ItemCart(
      {Key key,
      this.data,
      this.onPressedCheck,
      this.onDelete,
      this.onCong,
      this.onTru,
      this.isShow = false})
      : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  bool _show;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _show = widget.isShow;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height / 21.33333333333333,
                ),
                Container(
                    width: size.width/7.2,
                    child: FlatButton(
                        key: ValueKey(widget.data.sId),
                        onPressed: () {
                          setState(() {
                            _show = !_show;
                          });
                          widget?.onPressedCheck?.call();
                        },
                        child: _show
                            ? Image.asset(
                                'assets/icons/checkbox1.png',
                                height: size.height/21.33333333333333,
                                width: size.width/12,
                              )
                            : Image.asset(
                                'assets/icons/checkbox.png',
                                color: kPrimaryOrangeColor,
                                height: size.height/21.33333333333333,
                                width: size.width/12,
                              ))),
                // Container(
                //   child: StatefulBuilder(
                //     builder: (context, setState) => Checkbox(
                //       materialTapTargetSize:
                //           MaterialTapTargetSize.shrinkWrap,
                //       checkColor: Colors.white,
                //       activeColor: kPrimaryOrangeColor,
                //       value: _checkBox,
                //       onChanged: (value) {
                //         putIsStatus(
                //                 idProduct: widget
                //                     .cartResponseModel
                //                     .cart[index]
                //                     .sId)
                //             .then((value) => value);
                //         setState(() {
                //           _checkBox = value;
                //         });
                //         print("1");
                //
                //         //   widget.onRefreshCart();
                //         ApiCart.getData().then((value1) {
                //           setState(() {
                //             print("2");
                //             widget.cartResponseModel
                //                     .tongTienthanhtoan =
                //                 value1.tongTienthanhtoan;
                //           });
                //           print("3");
                //           tong = widget.cartResponseModel
                //               .tongTienthanhtoan;
                //           print("1 " + tong.toString());
                //           print("4");
                //         });
                //
                //         Future.delayed(Duration(milliseconds: 500), () {
                //           print("5");
                //           print("2 " + tong.toString());
                //           print("6");
                //         });
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          _imageProduct(widget.data.urlImage),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: size.width / 2.4,
                  child: _nameProduct(widget.data.tenSach)),
              Container(
                width: size.width / 1.8,
                child: Row(
                  children: [
                    _priceProduct(widget.data.giaBia),
                    SizedBox(
                      width: size.width / 8,
                    ),
                    Container(
                        child: FlatButton(
                            onPressed: widget.onDelete,
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset(
                              'assets/icons/remove.png',
                              height: size.height / 21.33333333333333,
                              width: size.width / 12,
                              fit: BoxFit.cover,
                              color: kPrimaryOrangeColor,
                            ))),
                  ],
                ),
              ),
              Container(
                width: size.width / 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    int.parse(widget.data.amount) != 1
                        ? _decrement(onPressed: widget.onTru)
                        : _decrement(onPressed: () {}),
                    Text("${widget.data.amount}"),
                    _increment(
                      onPressed: (widget.onCong),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void onChangeCheckBox(bool value) {}

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
             fontWeight: FontWeight.bold, fontSize: 16),
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
          style: TextStyle(),
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
              child: Icon(Icons.remove,color: kPrimaryBlackColor,),
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
              child: Icon(Icons.add,color: kPrimaryBlackColor,),
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
        Navigator.pushReplacementNamed(context, PageRoutes.cartPage);
      },
    );
    showDialog(
        context: context,
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
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
