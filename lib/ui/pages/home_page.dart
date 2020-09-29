part of 'pages.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SafeArea(
        child: Consumer<NewsProvider>(builder: (context, newsProvider, _){
          if (newsProvider.apiResponse.status == Status.COMPLETED) {
            return NewsPage();
          } else if (newsProvider.apiResponse.status == Status.ERROR) {
            return Center(child: Text(newsProvider.apiResponse.message));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        })
      ),
    );
  }
}