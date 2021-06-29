import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:book_store/feature/product_loai1/presentation/widget/gridViewProductLoai.dart';


import 'package:book_store/feature/product_loai6/presentation/manager/product6_bloc.dart';
import 'package:book_store/feature/product_loai6/presentation/manager/product6_event.dart';
import 'package:book_store/feature/product_loai6/presentation/manager/product6_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyProduct6Detail extends StatefulWidget {
  const BodyProduct6Detail({Key key}) : super(key: key);

  @override
  _BodyProduct6DetailState createState() => _BodyProduct6DetailState();
}

class _BodyProduct6DetailState extends State<BodyProduct6Detail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Product6Bloc, Product6State>(
      builder: (context, state) {
        if (state is Empty) {
          getProductLoai6();
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
  void getProductLoai6() {
    BlocProvider.of<Product6Bloc>(context).add((GetProduct6E()));
  }
}
