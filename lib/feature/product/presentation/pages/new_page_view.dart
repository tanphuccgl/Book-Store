import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_data.dart';
import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:flutter/material.dart';

Widget pageNew(
    {BuildContext context,
    List<ProductData> list5,
    Key key,
    ScrollController controller}) {
  Size size = MediaQuery.of(context).size;

  return Container(
      height: size.height / 2.133333333333333,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 25, right: 6),
        key: key,
        controller: controller,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final List<ProductData> list2 = list5.reversed.toList();
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetail(data: list2[index])));
            },
            child: Container(
              height: size.height / 2.56,
              width: size.width / 2.4,
              margin: EdgeInsets.only(right: 5, left: 5, bottom: 8, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _imageProduct(url: list2[index].urlImage, context: context),
                  _nameProduct(name: list2[index].tenSach, context: context),
                  _priceProduct(pricee: list2[index].giaBia),
                ],
              ),
            ),
          );
        },
        itemCount: 10,
      ));
}

Widget _nameProduct({String name, BuildContext context}) {
  Size size = MediaQuery.of(context).size;

  return Container(
    padding: EdgeInsets.only(bottom: 5),
    width: size.width / 3.6,
    child: Text(
      name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _priceProduct({String pricee}) {
  return Text(
    "Price: " + "₫${price.format(int.parse(pricee))}",
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget _imageProduct({String url, BuildContext context}) {
  Size size = MediaQuery.of(context).size;

  return Container(
    padding: EdgeInsets.only(bottom: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage(url)),
        boxShadow: [
          BoxShadow(
            color: kPrimaryGrayColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 12,
            offset: Offset(0, 3),
          )
        ]),
    height: size.height / 4.266666666666667,
    width: size.width / 4,
  );
}
