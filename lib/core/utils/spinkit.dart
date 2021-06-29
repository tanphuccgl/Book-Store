import 'package:book_store/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitLoading extends StatelessWidget {
  const SpinkitLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: SpinKitCircle(color: kPrimaryOrangeColor,));
  }
}
