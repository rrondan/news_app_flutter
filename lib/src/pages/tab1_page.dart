import 'package:flutter/material.dart';
import 'package:news_app_flutter/src/models/news_models.dart';
import 'package:news_app_flutter/src/services/news_service.dart';
import 'package:news_app_flutter/src/theme/tema.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewsService newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: _NewsList( newsService.headlines ),
    );
  }
}

class _NewsList extends StatelessWidget {
  final List<Article> _news;
  const _NewsList(this._news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _news.length,
      itemBuilder: (_, index){
        return _NewWidget(_news[index], index);
      }
    );
  }
}

class _NewWidget extends StatelessWidget {
  final Article _new;
  final int index;

  const _NewWidget(this._new, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TopBarCard(_new, index),
        _TitleCard(_new),
        _ImageCard(_new),
        _BodyCard(_new),
        _ButtonsCard(),
        SizedBox(height: 10),
        Divider(),
      ],
    );
  }
}

class _ButtonsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            fillColor: myTheme.accentColor,
            child: Icon(Icons.star_border),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(width: 12),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            child: Icon(Icons.more),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
    );
  }
}


class _BodyCard extends StatelessWidget {
  final Article _new;
  const _BodyCard(this._new);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text( _new.description ?? ""),
    );
  }
}


class _ImageCard extends StatelessWidget {

  final Article _new;

  const _ImageCard(this._new);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50)
        ),
        child: Container(
          child: (_new.urlToImage != null) ?
            FadeInImage(
              placeholder: AssetImage("assets/img/giphy.gif"),
              image: NetworkImage(_new.urlToImage),
            ) : Image(image: AssetImage("assets/img/no-image.png")),
        ),
      ),
    );
  }
}


class _TitleCard extends StatelessWidget {
  final Article _new;

  const _TitleCard(this._new);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(_new.title, style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.w700)
      ),
    );
  }
}

class _TopBarCard extends StatelessWidget {
  final Article _new;
  final int index;

  const _TopBarCard(this._new, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.only(top: 10, bottom: 12),
      child: Row(
        children: <Widget>[
          Text("${index + 1}. ", style: TextStyle(color: myTheme.accentColor)),
          Text("${_new.source.name}.")
        ],
      ),
    );
  }
}
