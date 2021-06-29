import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/cart/data/models/cart_response_model.dart';
import 'package:book_store/feature/cart/data/models/carted_data.dart';
import 'package:book_store/feature/profile/presentation/widgets/item_carted_widget.dart';
import 'package:flutter/material.dart';

class BodyCarted extends StatefulWidget {
  final CartResponseModel cartResponseModel;

  const BodyCarted({Key key, this.cartResponseModel}) : super(key: key);

  @override
  _BodyCartedState createState() => _BodyCartedState();
}

class _BodyCartedState extends State<BodyCarted> {
  @override
  Widget build(BuildContext context) {
    return widget.cartResponseModel != null
        ? Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: ListView.builder(
                  itemBuilder:(context,index){
                   List<ProductedData> list= widget.cartResponseModel.carted.reversed.toList();
                    return ItemCartedWidget(data: list[index],);
                  },
              itemCount:  widget.cartResponseModel.carted.length,),
            ),
        )
        : Center(
            child: SpinkitLoading(),
          );
  }
}
