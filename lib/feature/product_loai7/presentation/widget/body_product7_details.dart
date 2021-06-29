import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:book_store/feature/product_loai1/presentation/widget/gridViewProductLoai.dart';


import 'package:book_store/feature/product_loai7/presentation/manager/product7_bloc.dart';
import 'package:book_store/feature/product_loai7/presentation/manager/product7_event.dart';
import 'package:book_store/feature/product_loai7/presentation/manager/product7_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyProduct7Detail extends StatefulWidget {
  const BodyProduct7Detail({Key key}) : super(key: key);

  @override
  _BodyProduct7DetailState createState() => _BodyProduct7DetailState();
}

class _BodyProduct7DetailState extends State<BodyProduct7Detail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Product7Bloc, Product7State>(
      builder: (context, state) {
        if (state is Empty) {
          getProductLoai7();
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
  void getProductLoai7() {
    BlocProvider.of<Product7Bloc>(context).add((GetProduct7E()));
  }
}
