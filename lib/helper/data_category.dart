import 'package:news_app_api/models/category.dart';

List<Categorie> getCategories() {
  List<Categorie> categories = [
    Categorie(
        "Health",
        "https://images.unsplash.com/photo-1494390248081-4e521a5940db?"
            "ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&"
            "fit=crop&w=1595&q=80"),
    Categorie(
        "Entertainment",
        "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?"
            "ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&"
            "fit=crop&w=1500&q=80"),
    Categorie(
        "Business",
        "https://images.unsplash.com/photo-1507679799987-c73779587ccf?"
            "ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&"
            "fit=crop&w=1502&q=80"),
    Categorie(
        "General",
        "https://images.unsplash.com/photo-1495020689067-958852a7765e?"
            "ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&"
            "fit=crop&w=800&q=60"),
    Categorie(
        "Science",
        "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?"
            "ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&"
            "fit=crop&w=1504&q=80"),
  ];

  return categories;
}
