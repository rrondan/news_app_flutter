import 'package:flutter/material.dart';
import 'package:news_app_flutter/src/models/category_model.dart';
import 'package:news_app_flutter/src/services/news_service.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(child: _CategoriesList())
        ],
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _categories = Provider.of<NewsService>(context).categories;
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: _categories.length,
      itemBuilder: (context, index){
        final cName = _categories[index].name;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              _CategoryButton(_categories[index]),
              SizedBox(height: 5),
              Text("${cName[0].toUpperCase()}${cName.substring(1)}"),
            ],
          ),
        );
    });
  }
}

class _CategoryButton extends StatelessWidget {
  final Category _category;

  const _CategoryButton(this._category);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("Categoria: ${_category.name}");
      },
      child: Container(
          width: 45,
          height: 45,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white
          ),
          child: Icon(_category.icon, color: Colors.black54,)
      ),
    );
  }
}