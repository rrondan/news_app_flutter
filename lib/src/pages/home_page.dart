import 'package:flutter/material.dart';
import 'package:news_app_flutter/src/pages/tab1_page.dart';
import 'package:news_app_flutter/src/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> new _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _NavigationModel navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      //onTap: (index) => print("Index: $index"),
      onTap: (index) => navigationModel.currentPage = index,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text("Para ti")),
        BottomNavigationBarItem(icon: Icon(Icons.public), title: Text("Encabezados")),
    ]);
  }
}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _NavigationModel navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
      //physics: BouncingScrollPhysics(),
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier{

  int _currentPage = 0;
  PageController _pageController = new PageController();

  int get currentPage => this._currentPage;

  set currentPage(int valor){
    this._currentPage = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;

}
