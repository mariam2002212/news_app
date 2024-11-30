import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/presentation/screens/home/tabs/articles_list/article_item_widget.dart';

class ArticlesListWidget extends StatelessWidget {
  Source source;
  ArticlesListWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(source.id??''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          //we have got all the sources by the given category id
          List<Article> articles = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return ArticleItemWidget(article: articles[index]);
              },
            ),
          );
        },);
  }
}
