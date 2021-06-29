

import 'package:book_store/feature/cart/data/models/cart_response_model.dart';
import 'package:book_store/feature/product/data/models/product_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CartState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends CartState {}

class Loading extends CartState {}

class Loaded extends CartState {

  final CartResponseModel swagger;
  final List<ProductData> data;


 final String tongSanpham;




  Loaded({@required this.swagger, @required this.data,@required this.tongSanpham});

  @override
  List<Object> get props => [swagger];
}

class Error extends CartState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
