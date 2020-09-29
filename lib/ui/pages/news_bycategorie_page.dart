part of 'pages.dart';

class NewsByCategory extends StatelessWidget {
  String newsCategory;

  NewsByCategory({this.newsCategory});

  @override
  Widget build(BuildContext context) {
    Provider.of<NewsBycategoryProvider>(context, listen: false)
        .fetchNews(newsCategory);

    return Scaffold(
        appBar: myAppBar(),
        body: Consumer<NewsBycategoryProvider>(
            builder: (context, newsProvider, _) {
          if (newsProvider.apiResponse.status == Status.COMPLETED) {
            return ListNewsCategory();
          } else if (newsProvider.apiResponse.status == Status.ERROR) {
            return Center(child: Text(newsProvider.apiResponse.message));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }));
  }
}

class ListNewsCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Container(
            margin: EdgeInsets.only(top: 16),
            child: Consumer<NewsBycategoryProvider>(
                builder: (context, newsProvider, _) {
              List<Articles> articles = newsProvider.apiResponse.data.articles;

              return ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NewsItem(
                      imgUrl: articles[index].urlToImage ?? "",
                      title: articles[index].title ?? "",
                      desc: articles[index].description ?? "",
                      content: articles[index].content ?? "",
                      posturl: articles[index].url ?? "",
                      name: articles[index].source.name ?? "",
                    );
                  });
            })),
      ),
    );
  }
}
