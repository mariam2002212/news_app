import 'package:flutter/material.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/presentation/screens/home/home.dart';
import 'package:news_app/presentation/screens/home/tabs/articles_list/article_details_widget.dart';
import 'package:news_app/presentation/screens/splash/splash.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String articleDetails='/articleDetails';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
      case articleDetails:
        final article = settings.arguments as Article;
        return MaterialPageRoute(
          builder: (context) => ArticleDetailsWidget(article: article)
        );
    }
  }
}