import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/src/models/category_model.dart';
import 'package:news_app_flutter/src/pages/headlines_category/headlines_category_bloc.dart';
import 'package:news_app_flutter/src/theme/tema.dart';
import 'package:news_app_flutter/src/widgets/news_list.dart';

class HeadlinesCategoryTab extends StatefulWidget {
  @override
  _HeadlinesCategoryTabState createState() => _HeadlinesCategoryTabState();
}

class _HeadlinesCategoryTabState extends State<HeadlinesCategoryTab> {
  HeadlinesCategoryBloc _bloc = new HeadlinesCategoryBloc();
  String _selectedCategory = "business";

  @override
  void initState() {
    super.initState();
    _bloc.add(FetchHeadlinesCategory(_selectedCategory));
  }

  @override
  void dispose() {
    super.dispose();
    _bloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _categoryList(),
          Expanded(
            child: BlocBuilder(
              cubit: _bloc,
              builder: (context, state){
                if(state is HeadlinesCategoryLoading)
                  return Center(child: CircularProgressIndicator());
                if(state is HeadlinesCategorySuccess)
                  return NewsList(state.headlines);
                if(state is HeadlinesCategoryError)
                  return Center(child: Text("Ocurrio un error"));
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _categoryList(){
    return Container(
      height: 90,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _bloc.categories.length,
          itemBuilder: (context, index){
            final cName = _bloc.categories[index].name;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  _categoryButton(_bloc.categories[index]),
                  SizedBox(height: 5),
                  Text("${cName[0].toUpperCase()}${cName.substring(1)}"),
                ],
              ),
            );
          }),
    );
  }

  Widget _categoryButton(Category _category){
    return GestureDetector(
      onTap: (){
        print("Categoria: ${_category.name}");
        _selectedCategory = _category.name;
        _bloc.add(FetchHeadlinesCategory(_selectedCategory));
        setState(() { });
      },
      child: Container(
          width: 45,
          height: 45,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white
          ),
          child: Icon(_category.icon,
            color:_selectedCategory == _category.name
                ? myTheme.accentColor
                : Colors.black54,
          )
      ),
    );
  }
}
