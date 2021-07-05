import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/profile/presentation/components/background_about_us.dart';
import 'package:book_store/feature/profile/presentation/components/title_about_us.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  static const String routeName = '/AboutUsPage';

  const AboutUsPage({Key key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<bool> onWillPop() async {
      Navigator.pop(context);
      //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: kPrimaryBlackColor,

        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back,
        //       color: kPrimaryWhiteColor,
        //     ),
        //     onPressed: () {
        //       Navigator.pushReplacement(
        //           context, MaterialPageRoute(builder: (context) => HomePage()));
        //     },
        //   ),
        // ),
        body: Column(
          children: [
            // Row(
            //   children: [
            //     Container(
            //       padding: EdgeInsets.only(left: 25, right: 25),
            //       child: Text(
            //         "About Us",
            //         style: TextStyle(
            //             color: kPrimaryWhiteColor,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 25),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: size.height / 64,
            // ),
            BackdropAndRating(
              size: size,
            ),
            //      SizedBox(height: kDefaultPadding / 2),
            Container(
              height: size.height / 1.454545454545455,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  children: [
                    TitleDurationAndFabBtn(),
                    SizedBox(
                      height: size.height / 64,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                            onPressed: () {},
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset(
                              'assets/icons/facebook.png',
                              height: size.height / 16,
                              width: size.width / 9,
                            )),
                        FlatButton(
                            onPressed: () {},
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset(
                              'assets/icons/google.png',
                              height: size.height / 16,
                              width: size.width / 9,
                            )),
                        FlatButton(
                            onPressed: () {},
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset(
                              'assets/icons/twitter.png',
                              height: size.height / 16,
                              width: size.width / 9,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Introduce",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 42.66666666666667,
                    ),
                    Row(
                      children: [
                        Container(
                          width: size.width / 1.161290322580645,
                          child: Text(
                            "Products are always guaranteed to be intact when shipped because they are always protected in a strong carton or paper bag. The materials used to pack this book are also specially used by Book Store which are environmentally friendly.",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                            softWrap: true,
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 64,
                    ),
                    Row(
                      children: [
                        Text(
                          "Developer",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 32,
                    ),
                    Container(
                      height: size.height / 5.333333333333333,
                      width: size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            width: size.width / 4.5,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: size.height / 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/bang.jpg"),
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height / 64),
                                Text("N.V.Bang",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kPrimaryOrangeColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            width: size.width / 4.5,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: size.height / 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/phuc.jpg"),
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height / 64),
                                Text("P.N.T.Phuc",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kPrimaryOrangeColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            width: size.width / 4.5,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: size.height / 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/hiep.jpg"),
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height / 64),
                                Text("P.T.Hiep",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kPrimaryOrangeColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            width: size.width / 4.5,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: size.height / 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/tinh.jpg"),
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height / 64),
                                Text("T.D.Tinh",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kPrimaryOrangeColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
