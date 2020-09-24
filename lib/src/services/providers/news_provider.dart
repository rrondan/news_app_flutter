import 'package:news_app_flutter/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsProvider {

  static const _URL_NEWS = "https://newsapi.org/v2";
  static const _API_KEY = "147462a6e3c34bdd8e608ee6931c5a12";

  Future<List<Article>> getTopHeadlines() async{
    final url = "$_URL_NEWS/top-headlines?country=co&apiKey=$_API_KEY";
    final resp = await http.get(url);
    NewsResponse newsResponse = newsResponseFromJson( resp.body );
    return newsResponse.articles;
  }

  Future<List<Article>> getArticlesByCategory( String category) async{
    final url = "$_URL_NEWS/top-headlines?country=co&apiKey=$_API_KEY&category=$category";
    final resp = await http.get(url);
    NewsResponse newsResponse = newsResponseFromJson( resp.body );
    return newsResponse.articles;
  }
}