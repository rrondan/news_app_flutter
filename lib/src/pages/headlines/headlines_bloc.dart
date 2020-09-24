
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/src/models/news_models.dart';
import 'package:news_app_flutter/src/services/providers/news_provider.dart';
import 'package:news_app_flutter/src/pages/headlines/headlines_event.dart';
import 'package:news_app_flutter/src/pages/headlines/headlines_state.dart';

export 'package:news_app_flutter/src/pages/headlines/headlines_event.dart';
export 'package:news_app_flutter/src/pages/headlines/headlines_state.dart';

class HeadlinesBloc extends Bloc<HeadlinesEvent, HeadlinesState>{

  NewsProvider _newsProvider;

  HeadlinesBloc() : super(HeadlineUninitialized()) {
    _newsProvider = new NewsProvider();
  }

  @override
  Stream<HeadlinesState> mapEventToState(HeadlinesEvent event) async*{
    try{
      if(event is FetchHeadlines){
        yield HeadlineLoading();
        List<Article> headlines = await _newsProvider.getTopHeadlines();
        yield HeadlineSuccess(headlines: headlines);
      }
    }catch (e){
      yield HeadlineError(e.toString());
    }
  }

}