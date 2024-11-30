import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_txt_styles.dart';
import 'package:news_app/core/routes_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';

class ArticleItemWidget extends StatelessWidget {
  Article article;
  ArticleItemWidget({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //navigate to article details screen with param->article
        Navigator.pushNamed(context, RoutesManager.articleDetails,arguments: article);

      },
      child: Padding(
        padding: REdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(article.urlToImage??''),
            SizedBox(height: 8.h,),
            Text(article.source?.name??'',style: AppTxtStyles.sourceName,),
            SizedBox(height: 8.h,),
            Text(article.title??'',style: AppTxtStyles.articleTitle,),
            SizedBox(height: 8.h,),
            Text(article.publishedAt??'',textAlign:TextAlign.end,style: AppTxtStyles.publishedAt,),
          ],
        ),
      ),
    );
  }
}
