import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/product/data/models/product_data.dart';
import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:book_store/feature/product_loai1/presentation/manager/product1_bloc.dart';
import 'package:book_store/feature/product_loai1/presentation/manager/product1_event.dart';
import 'package:book_store/feature/product_loai1/presentation/manager/product1_state.dart';
import 'package:book_store/feature/product_loai1/presentation/widget/gridViewProductLoai.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyProduct1Detail extends StatefulWidget {
  const BodyProduct1Detail({Key key}) : super(key: key);

  @override
  _BodyProduct1DetailState createState() => _BodyProduct1DetailState();
}

class _BodyProduct1DetailState extends State<BodyProduct1Detail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Product1Bloc, Product1State>(
      builder: (context, state) {
        if (state is Empty) {
          getProductLoai1();
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
  void getProductLoai1() {
    BlocProvider.of<Product1Bloc>(context).add((GetProduct1E()));
  }
}
