import 'package:flutter/material.dart';
import 'package:news_app_api/ui/constants/text_style.dart';

Widget myAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Mak",
          style: kAppBar1,
        ),
        Text(
          "News",
          style: kAppBar2,
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
