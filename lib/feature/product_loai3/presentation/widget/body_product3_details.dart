import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:book_store/feature/product_loai1/presentation/manager/product1_bloc.dart';
import 'package:book_store/feature/product_loai1/presentation/manager/product1_event.dart';
import 'package:book_store/feature/product_loai1/presentation/widget/gridViewProductLoai.dart';
import 'package:book_store/feature/product_loai3/presentation/manager/product3_bloc.dart';
import 'package:book_store/feature/product_loai3/presentation/manager/product3_event.dart';
import 'package:book_store/feature/product_loai3/presentation/manager/product3_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyProduct3Detail extends StatefulWidget {
  const BodyProduct3Detail({Key key}) : super(key: key);

  @override
  _BodyProduct3DetailState createState() => _BodyProduct3DetailState();
}

class _BodyProduct3DetailState extends State<BodyProduct3Detail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Product3Bloc, Product3State>(
      builder: (context, state) {
        if (state is Empty) {
          getProductLoai3();
        } else if (state is Loading) {
          return SpinkitLoading();
        } else if (state is Loaded) {
          return gridViewProductLoai(context: context,list: state.data);
        } else if (state is Error) {
          return Text("tam thoi khong hoat dong");
        }
        return Container();
      },
    );
  }
  void getProductLoai3() {
    BlocProvider.of<Product3Bloc>(context).add((GetProduct3E()));
  }
}
