import 'package:flutter/material.dart';
import 'package:news_app_flutter/src/services/news_service.dart';
import 'package:news_app_flutter/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget{
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final NewsService newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: newsService.headlines.isEmpty ?
      Center(child: CircularProgressIndicator()) :
      NewsList( newsService.headlines ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}

