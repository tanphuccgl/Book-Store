import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:book_store/feature/product_loai1/presentation/widget/gridViewProductLoai.dart';

import 'package:book_store/feature/product_loai2/presentation/manager/product2_bloc.dart';
import 'package:book_store/feature/product_loai2/presentation/manager/product2_event.dart';
import 'package:book_store/feature/product_loai2/presentation/manager/product2_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyProduct2Detail extends StatefulWidget {
  const BodyProduct2Detail({Key key}) : super(key: key);

  @override
  _BodyProduct2DetailState createState() => _BodyProduct2DetailState();
}

class _BodyProduct2DetailState extends State<BodyProduct2Detail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Product2Bloc, Product2State>(
      builder: (context, state) {
        if (state is Empty) {
          getProductLoai2();
        } else if (state is Loading) {
          return SpinkitLoading();
        } else if (state is Loaded) {
          return gridViewProductLoai(list: state.data,context: context);
        } else if (state is Error) {
          return Text("tam thoi khong hoat dong");
        }
        return Container();
      },
    );
  }
  void getProductLoai2() {
    BlocProvider.of<Product2Bloc>(context).add((GetProduct2E()));
  }
}
