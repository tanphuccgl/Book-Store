import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

const mainUrl = "http://45.77.12.16:4000";
final kPrimaryBlackColor = HexColor("#333333");
final kPrimaryOrangeColor = HexColor("#F9825D");
final kPrimaryWhiteColor = HexColor("#f5f5f5");
final kPrimaryGrayColor = HexColor("#696763");
final kPrimaryYellowColor = HexColor("#ffff00");
final kPrimaryBlueColor = HexColor("#05EDFF");
final price = NumberFormat("###,###");


const SAVE_PROFILE_RESPONSE="SAVE_PROFILE_RESPONSE";
const SAVE_LOGIN_RESPONSE="SAVE_LOGIN_RESPONSE";
const String SERVER_FAILURE_MESSAGE = 'Something wrong! Try again';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
