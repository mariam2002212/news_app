import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:news_app/data/api/model/articles_response/articles_response.dart';
import 'package:news_app/data/api/model/sources_response/sources_response.dart';

class  ApiManager{
  static const String _baseUrl = 'newsapi.org';
  static const String _apiKey = 'b433991236964049ae4d27c1c5923cbd';
  static const String sourcesEndPoint = '/v2/top-headlines/sources';
  static const String articlesEndPoint = '/v2/everything';
  static const String topHeadLinesEndPoint='/v2/top-headlines';

  static Future<SourcesResponse>getSources(String categoryId)async{
    Uri url = Uri.https(_baseUrl,sourcesEndPoint,{
      'apiKey':_apiKey,
      'category':categoryId,
    });
    // make a network Request
    http.Response serverResponse = await http.get(url);
    // convert from string to json
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    //json to obj
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;

  }

  static Future<ArticlesResponse>getArticles(String sourceId)async{
    Uri url = Uri.https(_baseUrl,articlesEndPoint,{
      'apiKey': _apiKey,
      'sources':sourceId,
    });
    http.Response serverResponse = await http.get(url);
    Map<String,dynamic> json = jsonDecode(serverResponse.body);

    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }

  static Future<ArticlesResponse>searchArticles(String queryTxt)async{
    Uri url = Uri.https(_baseUrl, articlesEndPoint, {
      'apiKey': _apiKey,
      'q': queryTxt,
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}