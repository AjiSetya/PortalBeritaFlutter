import 'package:flutter/material.dart';
import 'package:news_app_api/helper/data_category.dart';
import 'package:news_app_api/helper/widgets.dart';
import 'package:news_app_api/models/category.dart';
import '../helper/data_request.dart';
import 'news_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  News news = News();

  List<Categorie> categories = List<Categorie>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff121212),
        appBar: myAppBar(),
        body: SafeArea(
            child: FutureBuilder(
                future: news.getNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return NewsPage(snapshot.data, categories);
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(child: Text("Data tidak tersedia"));
                  }

                  return Center(child: CircularProgressIndicator());
                })));
  }
}
