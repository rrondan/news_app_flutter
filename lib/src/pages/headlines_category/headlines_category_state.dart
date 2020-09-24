
import 'package:equatable/equatable.dart';
import 'package:news_app_flutter/src/models/news_models.dart';

abstract class HeadlinesCategoryState extends Equatable{
  const HeadlinesCategoryState();
  @override
  List<Object> get props => [];
}

class HeadlinesCategoryUninitialized extends HeadlinesCategoryState {
  HeadlinesCategoryUninitialized();
}

class HeadlinesCategoryLoading extends HeadlinesCategoryState {
  HeadlinesCategoryLoading();
}

class HeadlinesCategorySuccess extends HeadlinesCategoryState {
  final List<Article> headlines;

  HeadlinesCategorySuccess({this.headlines});

  @override
  List<Object> get props => [headlines];
}

class HeadlinesCategoryError extends HeadlinesCategoryState{
  final String messageError;

  HeadlinesCategoryError(this.messageError);

  @override
  List<Object> get props => [messageError];
}