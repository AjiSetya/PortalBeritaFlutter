import 'package:flutter/material.dart';
import 'package:news_app_api/ui/constants/colors.dart';
import 'package:news_app_api/ui/pages/pages.dart';
import 'package:provider/provider.dart';

import 'core/providers/providers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewsBycategoryProvider(),
        ),ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kScaffoldBackground),
        home: HomePage(),
      ),
    );
  }
}
