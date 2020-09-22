import 'package:flutter/material.dart';
import 'package:news_app_flutter/src/pages/home_page.dart';
import 'package:news_app_flutter/src/services/news_service.dart';
import 'package:news_app_flutter/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        title: 'News App',
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}