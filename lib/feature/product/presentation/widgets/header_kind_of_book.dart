import 'package:book_store/core/utils/constants.dart';
import 'package:flutter/material.dart';

Widget header({BuildContext context,String title,Function onPressed,Function onPressed2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _title(title: title),
      _icon(
          icon: Icons.notifications_active_outlined,
          icon2: Icons.shopping_cart_outlined,
          onPressed: onPressed,
          onPressed2: onPressed2)
    ],
  );
}

Widget _title({String title}) {
  return Row(
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 25,
            color: kPrimaryOrangeColor,
            fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget _icon(
    {IconData icon,
      IconData icon2,
      Function onPressed,
      Function onPressed2}) {
  return Row(
    children: [
      IconButton(
          icon: Icon(
            icon,
            color: kPrimaryOrangeColor,
          ),
          onPressed: onPressed),
      IconButton(
        icon: Icon(
          icon2,
          color: kPrimaryOrangeColor,
        ),
        onPressed: onPressed2,
      )
    ],
  );
}