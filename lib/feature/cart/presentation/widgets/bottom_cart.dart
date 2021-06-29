import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class bottomCart extends StatelessWidget {
  final String total;
  final Function onPressed;
  final Function onPressed1;

  const bottomCart({Key key, this.total, this.onPressed,this.onPressed1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showCancel() {
      var alert = new AlertDialog1(image: "cancel",
        title: "ERROR",
        description: "Functions in development",
        onPressed: () {
          Navigator.pop(context);
        },
      );
      showDialog(
          context: context,
          builder: (context) {
            return alert;
          });
    }
    Size size= MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: size.height/16,
                  width: size.width/9,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(onPressed: onPressed1,
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(
                      "assets/icons/receipt.png",
                      color: kPrimaryOrangeColor,width: size.width/3.6,height: size.height/6.4,
                      scale: 1,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Spacer(),
                TextButton(child: Text("Add voucher code"),onPressed: (){
                  showCancel();
                },),
                 SizedBox(width: size.width/36),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryOrangeColor,
                )
              ],
            ),
            SizedBox(height: size.height/32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "₫$total",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: size.width/1.894736842105263,
                    child: SizedBox(
                      width: double.infinity,
                      height: size.height/11.42857142857143,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: kPrimaryOrangeColor,
                        onPressed: onPressed,
                        child: Text(
                          "Check Out",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );

  }

}
