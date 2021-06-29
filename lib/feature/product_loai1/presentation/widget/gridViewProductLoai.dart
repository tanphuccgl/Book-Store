import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_data.dart';
import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:flutter/material.dart';

Widget gridViewProductLoai({
  BuildContext context,
  List<ProductData> list,
}) {
  return GridView.count(
    shrinkWrap: true,
    padding: EdgeInsets.all(0),
    childAspectRatio: 1,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    crossAxisCount: 2,
    children: list.map((e) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 17),
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 17,
                  spreadRadius: -23)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetail(data: e)));
            },
            child: Column(
              children: [
                Spacer(),
                _image(url: e.urlImage,context: context),
                Spacer(),
                _nameBook(name: e.tenSach),
              ],
            ),
          ),
        ),
      );
    }).toList(),
  );
}

Widget _image({String url,BuildContext context}) {
  Size size= MediaQuery.of(context).size;

  return Image.network(
    url,
    height: size.height/6.4,
    width: size.width/3.6,
  );
}

Widget _nameBook({String name}) {
  return Center(
      child: Text(
    name,style: TextStyle(color: kPrimaryGrayColor),
    maxLines: 2,
    textAlign: TextAlign.center,
    softWrap: true,
    overflow: TextOverflow.ellipsis,
  ));
}
