import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:book_store/feature/product_loai1/presentation/widget/gridViewProductLoai.dart';


import 'package:book_store/feature/product_loai4/presentation/manager/product4_bloc.dart';
import 'package:book_store/feature/product_loai4/presentation/manager/product4_event.dart';
import 'package:book_store/feature/product_loai4/presentation/manager/product4_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyProduct4Detail extends StatefulWidget {
  const BodyProduct4Detail({Key key}) : super(key: key);

  @override
  _BodyProduct4DetailState createState() => _BodyProduct4DetailState();
}

class _BodyProduct4DetailState extends State<BodyProduct4Detail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Product4Bloc, Product4State>(
      builder: (context, state) {
        if (state is Empty) {
          getProductLoai4();
        } else if (state is Loading) {
        } else if (state is Loaded) {
          return gridViewProductLoai(list: state.data,context: context);
        } else if (state is Error) {
          return Text("tam thoi khong hoat dong");
        }
        return Container();
      },
    );
  }
  void getProductLoai4() {
    BlocProvider.of<Product4Bloc>(context).add((GetProduct4E()));
  }
}
