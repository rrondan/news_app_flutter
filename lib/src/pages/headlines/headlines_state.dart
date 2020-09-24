
import 'package:equatable/equatable.dart';
import 'package:news_app_flutter/src/models/news_models.dart';

abstract class HeadlinesState extends Equatable{
  const HeadlinesState();
  @override
  List<Object> get props => [];
}

class HeadlineUninitialized extends HeadlinesState {
  HeadlineUninitialized();
}

class HeadlineLoading extends HeadlinesState {
  HeadlineLoading();
}

class HeadlineSuccess extends HeadlinesState {
  final List<Article> headlines;

  HeadlineSuccess({this.headlines});

  @override
  List<Object> get props => [headlines];
}

class HeadlineError extends HeadlinesState{
  final String messageError;

  HeadlineError(this.messageError);

  @override
  List<Object> get props => [messageError];
}