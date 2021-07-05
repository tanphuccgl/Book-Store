import 'dart:io';

import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:book_store/feature/profile/data/models/profile_response_model.dart';
import 'package:book_store/feature/profile/presentation/manager/profile_bloc.dart';
import 'package:book_store/feature/profile/presentation/manager/profile_event.dart';
import 'package:book_store/feature/profile/presentation/widgets/birthday_widget.dart';
import 'package:book_store/feature/profile/presentation/widgets/hihi.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class BodyMyAccount1 extends StatefulWidget {
  final ProfileResponseModel data;

  const BodyMyAccount1({Key key, @required this.data}) : super(key: key);

  @override
  _BodyMyAccount1State createState() => _BodyMyAccount1State();
}

class _BodyMyAccount1State extends State<BodyMyAccount1> {
  File _selectMedia;

  void _getMedia() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    uploadImage(image);
    setState(() {
      _selectMedia = image;
    });
  }

  String name;
  String address;
  String phoneNumber;
  String dateBirth;
  String sex;

  String introduce;

  bool _checkBox = true;
  bool _checkBox2 = false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _nameText =
        TextEditingController(text: widget?.data?.data?.name ?? "");
    TextEditingController _addressText =
        TextEditingController(text: widget?.data?.data?.address ?? "");

    TextEditingController _phoneNumberText =
        TextEditingController(text: widget?.data?.data?.phoneNumber ?? "");
    TextEditingController _introduceText =
        TextEditingController(text: widget?.data?.data?.introduce ?? "");

    return widget.data != null
        ? Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: ListView(
                children: [
                  SizedBox(
                    height: size.height / 42.66666666666667,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: size.width / 2.769230769230769,
                          height: size.height / 4.923076923076923,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: _selectMedia != null
                                      ? FileImage(_selectMedia, scale: 1)
                                      : NetworkImage(
                                          widget.data.data.imagePerson,
                                        ))),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: size.height / 16,
                              width: size.width / 9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: kPrimaryOrangeColor,
                              ),
                              child: Center(
                                child: FlatButton(
                                  padding: EdgeInsets.only(right: 2),
                                  onPressed: () {
                                    _getMedia();
                                  },
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 18.28571428571429,
                  ),
                  _buildTextField(
                    title: "Full Name",
                    textEditingController: _nameText,
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    maxLength: 30,
                    info: widget.data?.data?.name ?? "Chưa có dữ liệu",
                    onChange: (value) {
                      name = value;
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "     Sex: ${widget.data.data.sex==0?"Female":"Male"}",
                        style:
                        TextStyle(color: kPrimaryOrangeColor, fontSize: 13),
                      ),
                      SizedBox(
                        width: size.width / 7.2,
                      ),
                   _sex(
                        context: context,
                        value: _checkBox,
                        value2: _checkBox2,
                        onChange1: (value) {
                          setState(() {
                            _checkBox = value;
                            _checkBox2 = !_checkBox;
                          });
                        },
                        onChange2: (value) {
                          setState(() {
                            _checkBox2 = value;
                            _checkBox = !_checkBox2;
                          });
                        },
                      ),
                    ],
                  ),

                  Padding(padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text(
                          "     Date Birth",
                          style:
                              TextStyle(color: kPrimaryOrangeColor, fontSize: 13),
                        ),
                        SizedBox(
                          width: size.width / 7.2,
                        ),
                        DatePickerWidget(
                          data: widget.data,
                        ),
                      ],
                    ),
                  ),

                  // _buildTextField(
                  //     title: "Date Birth",
                  //     info: widget.data?.data?.dateBirth ?? "Chưa có dữ liệu",
                  //     onChange: (value) {
                  //       dateBirth = value;
                  //     }),
                  _buildTextField(
                      title: "Number Phone",
                      textEditingController: _phoneNumberText,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      maxLines: 1,
                      info: widget.data?.data?.phoneNumber ?? "Chưa có dữ liệu",
                      onChange: (value) {
                        phoneNumber = value;
                      }),
                  _buildTextField(
                      title: "Address",
                      textEditingController: _addressText,
                      maxLines: 2,
                      maxLength: 60,
                      info: widget.data?.data?.address ?? "Chưa có dữ liệu",
                      onChange: (value) {
                        address = value;
                      }),
                  _buildTextField(
                      title: "Bio",
                      maxLines: 3,
                      maxLength: 90,
                      textEditingController: _introduceText,
                      info: widget.data?.data?.introduce ?? "Chưa có dữ liệu",
                      onChange: (value) {
                        introduce = value;
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlineButton(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                       Navigator.pop(context);
                        },
                        child: Text("CANCEL",
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                            )),
                      ),
                      RaisedButton(
                        onPressed: () {

                            if (_checkBox) {
                              sex = "1";
                            } else {
                              sex = "0";
                            }
                            print(dateBirth);
                           if(name==null)
                             {
                               name=widget.data.data.name;
                             }if(address==null)
                               {
                                 address=widget.data.data.address;
                               }if(phoneNumber==null)
                                 {
                                   phoneNumber=widget.data.data.phoneNumber;
                                 }if(dateBirth==null)
                                   {
                                     dateBirth=widget.data.data.dateBirth;
                                   }if(introduce==null)
                                     {
                                       introduce=widget.data.data.introduce;
                                     }
                            print(dateBirth+"!");
                            changeProfile(
                                name: name,
                                address: address,
                                phoneNumber: phoneNumber,
                                dateBirth: dateBirth,
                                sex: sex,
                                introduce: introduce,
                                function: showSuccess,
                                function2: showFailed);

                        },
                        color: kPrimaryOrangeColor,
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height / 32,
                  ),
                ],
              ),
            ),
          )
        : Expanded(child: Center(child: SpinkitLoading()));
  }

  void getProfile() {
    BlocProvider.of<ProfileBloc>(context).add((GetProfileE()));
  }

  Widget _sex(
      {BuildContext context,
      bool value,
      bool value2,
      Function onChange1,
      Function onChange2}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                StatefulBuilder(
                  builder: (context, setState) => Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    checkColor: Colors.white,
                    activeColor: kPrimaryOrangeColor,
                    value: value,
                    onChanged: onChange1,
                  ),
                ),
                Container(
                  child: Text(
                    "Male",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                StatefulBuilder(
                  builder: (context, setState) => Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    checkColor: Colors.white,
                    activeColor: kPrimaryOrangeColor,
                    value: value2,
                    onChanged: onChange2,
                  ),
                ),
                Container(
                  child: Text(
                    "Female",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {String title,
      Function onChange,
      String info,
      int maxLines,
      int maxLength,
      String errorText,
      TextEditingController textEditingController,
      TextInputType keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        onChanged: onChange,
        textAlign: TextAlign.start,
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
        controller: textEditingController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3, left: 10),
            labelText: "  " + title,
            labelStyle: TextStyle(color: kPrimaryOrangeColor),
            errorText: errorText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryOrangeColor)),
            hintText: info,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            )),
      ),
    );
  }

  void showSuccess() {
    var alert = new AlertDialog1(
      image: "done",
      title: "Succes",
      description: "Edit profile successfully ",
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, PageRoutes.profilePage);
      },
    );
    showDialog(
        context: context,barrierDismissible: false,
        builder: (context) {
          return alert;
        });
  }

  void showFailed() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "Failed",
      description: "Edit profile fail",
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
