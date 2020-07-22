import 'package:flutter/material.dart';
import 'package:news_app_api/helper/data_request.dart';
import 'package:news_app_api/helper/widgets.dart';
import 'package:news_app_api/models/ResponseBerita.dart';

import 'news_item.dart';

class NewsByCategorie extends StatefulWidget {
  final String newsCategory;
  NewsByCategorie({this.newsCategory});

  @override
  _NewsByCategorieState createState() => _NewsByCategorieState(newsCategory);
}

class _NewsByCategorieState extends State<NewsByCategorie> {
  RequestByCategorie newsByCategory = RequestByCategorie();
  String newsCategory;

  _NewsByCategorieState(this.newsCategory);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff121212),
        appBar: myAppBar(),
        body: FutureBuilder(
            future: newsByCategory.getNewsByCategory(newsCategory),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListNewsCategory(snapshot.data);
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text("Data tidak tersedia"));
              }

              return Center(child: CircularProgressIndicator());
            }));
  }
}

class ListNewsCategory extends StatelessWidget {
  ResponseBerita responseBerita;

  ListNewsCategory(this.responseBerita);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Container(
          margin: EdgeInsets.only(top: 16),
          child: ListView.builder(
              itemCount: responseBerita.articles.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return NewsItem(
                  imgUrl: responseBerita.articles[index].urlToImage ?? "",
                  title: responseBerita.articles[index].title ?? "",
                  desc: responseBerita.articles[index].description ?? "",
                  content: responseBerita.articles[index].content ?? "",
                  posturl: responseBerita.articles[index].url ?? "",
                  name: responseBerita.articles[index].source.name ?? "",
                );
              }),
        ),
      ),
    );
  }
}
