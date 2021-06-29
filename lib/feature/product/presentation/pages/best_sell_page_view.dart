import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_data.dart';
import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget pageBestSell({BuildContext context, List<ProductData> list}) {
  Size size = MediaQuery.of(context).size;

  return Container(
    width: size.width,
    height: size.height / 1.6,
    child: ListView(
        padding: EdgeInsets.only(left: 25, right: 25, top: 15),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: list
            .map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetail(data: e)));
                },
                child: Container(
                  width: size.width / 3.6,
                  margin: EdgeInsets.only(bottom: 19),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _imageProduct(url: e.urlImage, context: context),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _nameProduct(name: e.tenSach, context: context),
                          _nameAuthor(author: e.tacGia, context: context),
                          _priceProduct(pricee: e.giaBia, context: context)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList()),
  );
}

Widget _nameProduct({String name, BuildContext context}) {
  Size size = MediaQuery.of(context).size;

  return Container(
    padding: EdgeInsets.only(bottom: 5),
    width: size.width / 2.117647058823529,
    child: Text(
      name,
      softWrap: true,
      maxLines: 3,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    ),
  );
}

Widget _priceProduct({String pricee, BuildContext context}) {
  return Text("₫${price.format(int.parse(pricee))}");
}

Widget _nameAuthor({String author, BuildContext context}) {
  Size size = MediaQuery.of(context).size;

  return Container(
    padding: EdgeInsets.only(bottom: 5),
    width: size.width / 2.117647058823529,
    child: Text(
      author,
      softWrap: true,
      maxLines: 2,
      style: TextStyle(
          fontSize: 14, color: kPrimaryGrayColor, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _imageProduct({String url, BuildContext context}) {
  Size size = MediaQuery.of(context).size;

  return Container(
    padding: EdgeInsets.only(right: 21),
    height: size.height / 5.333333333333333,
    width: size.width / 3.6,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(image: NetworkImage(url)),
        boxShadow: [
          BoxShadow(
            color: kPrimaryGrayColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 12,
            offset: Offset(0, 3),
          )
        ]),
  );
}
