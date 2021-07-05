import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/cart/data/models/carted_data.dart';
import 'package:flutter/material.dart';

class ItemCartedWidget extends StatefulWidget {
  final ProductedData data;

  const ItemCartedWidget({Key key, this.data}) : super(key: key);

  @override
  _ItemCartedWidgetState createState() => _ItemCartedWidgetState();
}

class _ItemCartedWidgetState extends State<ItemCartedWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      width: size.width / 6,
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width / 2.4,
                child: _amount(widget.data.amount),
              ),
              SizedBox(
                width: size.width / 6,
              ),
              Container(
                width: size.width / 2.4,
                child: _purchaseDate(widget.data.datePayment),
              ),
              SizedBox(
                width: size.width / 6,
              ),
            ],
          )
        ],
      ),
    );
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

  Widget _amount(String amount) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        width: size.width / 1.8,
        child: Text(
          "${amount} products",
          style: TextStyle(

          ),
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _purchaseDate(String date) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        width: size.width / 1.8,
        child: Text(
          "Date: ${DateTime.parse(date)} ",
          style: TextStyle(

          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
