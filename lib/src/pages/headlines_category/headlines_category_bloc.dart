import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app_flutter/src/models/category_model.dart';
import 'package:news_app_flutter/src/models/news_models.dart';
import 'package:news_app_flutter/src/services/providers/news_provider.dart';
import 'headlines_category_state.dart';
import 'headlines_category_event.dart';
export 'headlines_category_state.dart';
export 'headlines_category_event.dart';

class HeadlinesCategoryBloc extends Bloc<HeadlinesCategoryEvent, HeadlinesCategoryState>{

  NewsProvider _newsProvider;

  List<Category> _categories = [
    Category( FontAwesomeIcons.building, "business"),
    Category( FontAwesomeIcons.tv, "entertainment"),
    Category( FontAwesomeIcons.addressCard, "general"),
    Category( FontAwesomeIcons.headSideVirus, "health"),
    Category( FontAwesomeIcons.vials, "science"),
    Category( FontAwesomeIcons.volleyballBall, "sports"),
    Category( FontAwesomeIcons.memory, "technology"),
  ];

  List<Category> get categories => _categories;
  Map<String, List<Article>> categoryArticles = {};

  HeadlinesCategoryBloc() : super(HeadlinesCategoryUninitialized()) {
    _newsProvider = new NewsProvider();
    categories.forEach((category) {
      categoryArticles[category.name] = new List();
    });
  }

  @override
  Stream<HeadlinesCategoryState> mapEventToState(HeadlinesCategoryEvent event) async*{
    try{
      if(event is FetchHeadlinesCategory){
        yield HeadlinesCategoryLoading();
        if(categoryArticles[event.selectedCategory].isEmpty) {
          categoryArticles[event.selectedCategory] =
          await _newsProvider.getArticlesByCategory(event.selectedCategory);
        }
        yield HeadlinesCategorySuccess(headlines: categoryArticles[event.selectedCategory]);
      }
    }catch (e){
      yield HeadlinesCategoryError(e.toString());
    }
  }

}