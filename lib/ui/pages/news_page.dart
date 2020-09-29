part of 'pages.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: Consumer<CategoryProvider>(
                builder: (context, categoryProv, _) {
                  List<Category> categories = categoryProv.categories;

                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          imageAssetUrl: categories[index].imageUrl,
                          categoryName: categories[index].categoryName,
                        );
                      });
                },
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 16),
                child:
                    Consumer<NewsProvider>(builder: (context, newsProvider, _) {
                  List<Articles> articles =
                      newsProvider.apiResponse.data.articles;

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
          ],
        ),
      ),
    );
  }
}
