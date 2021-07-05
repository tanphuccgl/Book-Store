import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BackdropAndRating extends StatelessWidget {
  const BackdropAndRating({
    Key key,
    @required this.size,

  }) : super(key: key);

  final Size size;


  @override
  Widget build(BuildContext context) {
    return Container(
      // 40% of our total height
      height: size.height/3.2,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height/3.106796116504854,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/team.png"),
              ),
            ),
          ),
          // Rating Box

          // Back Button
          SafeArea(child: BackButton()),
        ],
      ),
    );
  }
}
