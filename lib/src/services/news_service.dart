import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app_flutter/src/models/category_model.dart';
import 'package:news_app_flutter/src/models/news_models.dart';
import 'package:news_app_flutter/src/services/providers/news_provider.dart';

//Va a ser nuestro ChangeNotifier
class NewsService with ChangeNotifier{
  final NewsProvider _newsProvider = NewsProvider();
  List<Article> _headlines = [];
  String _selectedCategory = "business";
  bool _isLoading = false;
  List<Category> _categories = [
    Category( FontAwesomeIcons.building, "business"),
    Category( FontAwesomeIcons.tv, "entertainment"),
    Category( FontAwesomeIcons.addressCard, "general"),
    Category( FontAwesomeIcons.headSideVirus, "health"),
    Category( FontAwesomeIcons.vials, "science"),
    Category( FontAwesomeIcons.volleyballBall, "sports"),
    Category( FontAwesomeIcons.memory, "technology"),
  ];

  bool get isLoading => _isLoading;
  List<Article> get headlines => _headlines;
  List<Category> get categories => _categories;
  String get selectedCategory => _selectedCategory;
  set selectedCategory( String valor ){
    this._selectedCategory = valor;
    this.getArticlesByCategory(valor);
    notifyListeners();
  }
  List<Article> get getArticlesSelectedCategory => categoryArticles[_selectedCategory];

  Map<String, List<Article>> categoryArticles = {};

  NewsService(){
    this.getTopHeadlines();

    categories.forEach((category) {
      categoryArticles[category.name] = new List();
    });
    getArticlesByCategory(_selectedCategory);
  }

  getTopHeadlines() async{
    List<Article> result = await _newsProvider.getTopHeadlines();
    _headlines.addAll(result);
    notifyListeners();
  }

  getArticlesByCategory( String category ) async{
    if(categoryArticles[category].isEmpty){
      _isLoading = true;
      notifyListeners();
      categoryArticles[category] = await _newsProvider.getArticlesByCategory(category);
      _isLoading = false;
    }
    notifyListeners();
  }

}