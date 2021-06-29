import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/presentation/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static const String routeName = '/ChatPage';
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(

      bottomNavigationBar: BottomBar(index: 2,),
      body: Padding(
        padding: EdgeInsets.only(left: 25, top: 40, right: 25),
        child: Column(
          children: [
            Center(
              child: Image.asset("assets/images/a12.png",width: size.width/0.9,height: size.height/1.6,),
            ),
            Text(
                "FUNCTIONS IN DEVELOPMENT",textAlign: TextAlign.center,
            style: TextStyle(color: kPrimaryOrangeColor,fontWeight: FontWeight.bold,fontSize: 20),)
          ]
        )
      ),
    );
  }
}
