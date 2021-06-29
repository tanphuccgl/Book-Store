import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/product/presentation/widgets/product_detail.dart';
import 'package:book_store/feature/product_loai1/presentation/widget/gridViewProductLoai.dart';


import 'package:book_store/feature/product_loai5/presentation/manager/product5_bloc.dart';
import 'package:book_store/feature/product_loai5/presentation/manager/product5_event.dart';
import 'package:book_store/feature/product_loai5/presentation/manager/product5_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyProduct5Detail extends StatefulWidget {
  const BodyProduct5Detail({Key key}) : super(key: key);

  @override
  _BodyProduct5DetailState createState() => _BodyProduct5DetailState();
}

class _BodyProduct5DetailState extends State<BodyProduct5Detail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Product5Bloc, Product5State>(
      builder: (context, state) {
        if (state is Empty) {
          getProductLoai5();
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
  void getProductLoai5() {
    BlocProvider.of<Product5Bloc>(context).add((GetProduct5E()));
  }
}
