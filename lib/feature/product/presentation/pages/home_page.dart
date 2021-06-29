import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/injection_container.dart';
import 'package:book_store/core/utils/key.dart';
import 'package:book_store/feature/product/presentation/manager/product_bloc.dart';
import 'package:book_store/feature/product/presentation/widgets/body_home.dart';
import 'package:book_store/feature/product/presentation/widgets/bottom_bar.dart';
import 'package:book_store/feature/profile/presentation/widgets/body_my_account1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/HomePage';
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Permission permission;
  PermissionStatus permissionStatus = PermissionStatus.denied;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: _buildBody(context),
      bottomNavigationBar: BottomBar(
        index: 0,
      ),
    );
  }

  BlocProvider<ProductBloc> _buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<ProductBloc>(),
        child: Stack(
          children: [BodyHome()],
        ));
  }
  void listenForPermission() async {
    final status = await Permission.mediaLibrary.status;
    setState(() {
      permissionStatus=status;
    });
    switch (status) {
      case PermissionStatus.denied:
        requestForPermission();
        break;
      case PermissionStatus.granted:
        break;
      case PermissionStatus.limited:
        Navigator.pop(context);
        break;
      case PermissionStatus.restricted:
        Navigator.pop(context);
        break;
      case PermissionStatus.permanentlyDenied:
        Navigator.pop(context);
        break;
    }
  }

  Future<void> requestForPermission() async {
    final status = await Permission.mediaLibrary.request();
    setState(() {
      permissionStatus = status;
    });
  }
}
