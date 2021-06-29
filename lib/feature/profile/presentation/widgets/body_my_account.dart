import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:book_store/core/utils/get_current_user.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/core/utils/spinkit.dart';
import 'package:book_store/feature/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:book_store/feature/profile/data/models/profile_data.dart';
import 'package:book_store/feature/profile/presentation/manager/profile_bloc.dart';
import 'package:book_store/feature/profile/presentation/manager/profile_event.dart';
import 'package:book_store/feature/profile/presentation/manager/profile_state.dart';
import 'package:book_store/feature/profile/presentation/pages/profile_page.dart';
import 'package:book_store/feature/sign_in/data/models/login_data.dart';
import 'package:book_store/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyMyAccount extends StatefulWidget {
  const BodyMyAccount({Key key}) : super(key: key);

  @override
  _BodyMyAccountState createState() => _BodyMyAccountState();
}

class _BodyMyAccountState extends State<BodyMyAccount> {
  String name;
  String address;
  String phoneNumber;
  String dateBirth;
  String sex;
  String introduce;
  bool _checkBox = true;
  bool _checkBox2 = false;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is Empty) {
          getProfile();
        }


        else if (state is Loading) {
          return SpinkitLoading();
        } else if (state is Loaded) {
          return Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: ListView(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
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
                                  image: NetworkImage(
                                    "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                                  ))),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: Colors.green,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  _buildTextField(
                    title: "Full Name",
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    maxLength: 30,
                    info: state.data.name,
                    onChange: (value) {
                      name = value;
                    },
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
                  _buildTextField(
                      title: "Date Birth",
                      info: state.data.dateBirth,
                      onChange: (value) {
                        dateBirth = value;
                      }),
                  _buildTextField(
                      title: "Number Phone",
                      keyboardType: TextInputType.phone,
                      maxLength: 13,
                      maxLines: 1,
                      info: state.data.phoneNumber,
                      onChange: (value) {
                        phoneNumber = value;
                      }),
                  _buildTextField(
                      title: "Address",
                      maxLines: 2,
                      maxLength: 60,
                      info: state.data.address,
                      onChange: (value) {
                        address = value;
                      }),
                  _buildTextField(
                      title: "Bio",
                      maxLines: 3,
                      maxLength: 90,
                      info: state.data.introduce,
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
                          Navigator.pushReplacementNamed(context, PageRoutes.profilePage);
                        },
                        child: Text("CANCEL",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.black)),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            changeProfile(
                                name: name,
                                address: address,
                                phoneNumber: phoneNumber,
                                dateBirth: dateBirth,
                                sex: sex,
                                introduce: introduce,
                                function: showSuccess,
                                function2: showFailed);
                          });
                        },
                        color: Colors.green,
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
                  )
                ],
              ),
            ),
          );
        } else if (state is Error) {
          return Text("tam thoi khong hoat dong");
        }
        return Container();
      },
    );
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
                    "Nam",
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
                    "Nu",
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
      TextInputType keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        onChanged: onChange,
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: title,
            errorText: errorText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: info,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  void showSuccess() {
    var alert = new AlertDialog1(image: "done",
      title: "Succes",
      description: "Edit profile successfully ",
      onPressed: () {
        Navigator.pushReplacementNamed(context, PageRoutes.profilePage);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void showFailed() {
    var alert = new AlertDialog1(image: "cancel",
      title: "Failed",
      description: "Edit profile fail ",
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
