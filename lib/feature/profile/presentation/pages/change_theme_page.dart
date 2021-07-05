import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/page_router.dart';
import 'package:book_store/feature/profile/presentation/widgets/change_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemePage extends StatefulWidget {
  static const String routeName = '/ChangeThemePage';

  const ChangeThemePage({Key key}) : super(key: key);

  @override
  _ChangeThemePageState createState() => _ChangeThemePageState();
}

class _ChangeThemePageState extends State<ChangeThemePage> {
  bool _checkBox = false;
  bool _checkBox1 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryOrangeColor,
          ),
          onPressed: () {
           Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  themeProvider.isDarkMode
                      ? Image.asset(
                          "assets/images/light.png",
                          height: size.height / 2.56,
                          width: size.width / 1.44,
                        )
                      : Image.asset(
                          "assets/images/light3.png",
                          height: size.height / 2.56,
                          width: size.width / 1.44,
                        ),
                  SizedBox(
                    height: size.height / 32,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        checkColor: Colors.white,
                        activeColor: kPrimaryOrangeColor,
                        value: themeProvider.isDarkMode,
                        onChanged: (value) {
                          final provider = Provider.of<ThemeProvider>(context,
                              listen: false);
                          provider.toggleTheme(value);

                        },
                      ),
                      themeProvider.isDarkMode ? Text("Dark") : Text("Light")
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
