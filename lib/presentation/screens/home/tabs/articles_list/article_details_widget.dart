import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_txt_styles.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsWidget extends StatelessWidget {
  Article article;
  ArticleDetailsWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(image: AssetImage(AssetsManager.bgPattern)),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('News Title'),
        ),
        body:Padding(
          padding: REdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(article.urlToImage ?? ''),
              SizedBox(height: 8.h),
              Text(article.title ?? '', style: AppTxtStyles.articleTitle),
              SizedBox(height: 8.h),
              Text(article.content ?? '', style: AppTxtStyles.articleDescription),
              SizedBox(height: 8.h),
              Text(
                ' ${article.publishedAt ?? ''}',
                style: AppTxtStyles.publishedAt,
                 textAlign: TextAlign.end,
              ),
              SizedBox(height: 8.h),
              InkWell(
                onTap: (){
                  launchUrl(Uri.parse(article.url??''));
                },
                child: Text(
                  'View Full Article',
                  style: AppTxtStyles.publishedAt,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    }
}
