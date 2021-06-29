
import 'package:book_store/feature/product/data/models/product_data.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class Product2State extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends Product2State {}

class Loading extends Product2State {}

class Loaded extends Product2State {
  final ProductResponseModel swagger;
  final List<ProductData> data;


  Loaded({@required this.swagger, @required this.data});

  @override
  List<Object> get props => [swagger];
}

class Error extends Product2State {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
