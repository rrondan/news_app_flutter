import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app_flutter/src/models/category_model.dart';
import 'package:news_app_flutter/src/models/news_models.dart';
import 'package:news_app_flutter/src/services/providers/news_provider.dart';

//Va a ser nuestro ChangeNotifier
class NewsService with ChangeNotifier{
  final NewsProvider _newsProvider = NewsProvider();
  List<Article> _headlines = [];
  List<Category> _categories = [
    Category( FontAwesomeIcons.building, "business"),
    Category( FontAwesomeIcons.tv, "entertainment"),
    Category( FontAwesomeIcons.addressCard, "general"),
    Category( FontAwesomeIcons.headSideVirus, "health"),
    Category( FontAwesomeIcons.vials, "science"),
    Category( FontAwesomeIcons.volleyballBall, "sports"),
    Category( FontAwesomeIcons.memory, "technology"),
  ];

  List<Article> get headlines => _headlines;
  List<Category> get categories => _categories;

  NewsService(){
    this.getTopHeadlines();
  }

  getTopHeadlines() async{
    List<Article> result = await _newsProvider.getTopHeadlines();
    _headlines.addAll(result);
    notifyListeners();
  }

}