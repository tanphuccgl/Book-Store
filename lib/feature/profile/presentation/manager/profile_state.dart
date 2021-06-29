
import 'package:book_store/feature/profile/data/models/profile_data.dart';
import 'package:book_store/feature/profile/data/models/profile_response_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfileState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends ProfileState {}

class Loading extends ProfileState {}

class Loaded extends ProfileState {

  final ProfileResponseModel swagger;
  final ProfileData data;


  Loaded({@required this.swagger, @required this.data});

  @override
  List<Object> get props => [swagger];
}

class Error extends ProfileState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
class ProfileAlready extends ProfileState{}
class NotProfile extends ProfileState{}
