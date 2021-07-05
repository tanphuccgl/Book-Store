import 'dart:async';


import 'package:book_store/core/api/api_product.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/product/data/models/product_data.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = '/SearchRoomPage';

  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ProductResponseModel productResponseModel;
  List<ProductData> products = [];
  String query = '';
  Timer debouncer;

  @override
  void initState() {
    super.initState();
    ApiProduct.getData().then((value) {
      setState(() {
        productResponseModel = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryOrangeColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: productResponseModel != null
          ? Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Search Book",
                  style: TextStyle(
                      color: kPrimaryOrangeColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: size.height / 64,
            ),
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                  data: product,
                                )));
                      },
                      child: Container(
                        width: size.width / 3.6,
                        margin: EdgeInsets.only(bottom: 19),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _imageProduct(url: product.urlImage, context: context),
                            SizedBox(width:size.width/18 ,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _nameProduct(name: product.tenSach, context: context),
                                _nameAuthor(author: product.tacGia, context: context),
                                _priceProduct(pricee: product.giaBia, context: context)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
          : Center(
        child: SpinkitLoading(),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Book title?',
    onChanged: searchBook,
  );

  Future searchBook(String query) async {
    final products = await productResponseModel.data.where((e) {
      final a = e.tenSach.toLowerCase();
      final b = query.toLowerCase();
      return a.contains(b);
    }).toList();

    setState(() {
      this.query = query;
      this.products = products;
    });
  }
}

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key key,
    @required this.text,
    @required this.onChanged,
    @required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: size.height/15.23809523809524,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: kPrimaryOrangeColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: kPrimaryOrangeColor),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
            child: Icon(Icons.close, color:kPrimaryOrangeColor),
            onTap: () {
              controller.clear();
              widget.onChanged('');
              FocusScope.of(context).requestFocus(FocusNode());
            },
          )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
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