
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/custom_alert_dialog/alert_dialog1.dart';
import 'package:flutter/material.dart';


class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Row(crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height:size.height/32 ,),
              Text(
                "Book Store",
                style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,),
              ),
              SizedBox(height:size.height/80),
              Row(
                children: <Widget>[
                  Text(
                    'Version',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: size.width/18),
                  Text(
                    "1.0.0",
                    style: TextStyle(color: Colors.white),
                  ),
                  //     SizedBox(width: kDefaultPadding),

                ],
              )
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 15),
          child: SizedBox(
            height: 64,
            width: 64,
            child: FlatButton(
              onPressed: () {

                var alert = new AlertDialog1(
                  image: "cancel",
                  title: "Evaluate",
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

              },
              color: kPrimaryOrangeColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.star_border,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
