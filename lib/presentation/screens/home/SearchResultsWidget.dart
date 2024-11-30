import 'package:flutter/material.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/presentation/screens/home/tabs/articles_list/article_item_widget.dart';

class SearchResultsWidget extends StatelessWidget {
  List<Article> articles;

  SearchResultsWidget({required this.articles});

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return const Center(child: Text('No articles found.'));
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        Article article = articles[index];
        return ArticleItemWidget(article: article);
      },
    );
  }
}
