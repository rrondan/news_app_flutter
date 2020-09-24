import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/src/pages/headlines/headlines_bloc.dart';
import 'package:news_app_flutter/src/widgets/news_list.dart';

class HeadlinesTab extends StatefulWidget {
  @override
  _HeadlinesTabState createState() => _HeadlinesTabState();
}

class _HeadlinesTabState extends State<HeadlinesTab> with AutomaticKeepAliveClientMixin{

  HeadlinesBloc _headlinesBloc = new HeadlinesBloc();

  @override
  void initState() {
    super.initState();
    _headlinesBloc.add(FetchHeadlines());
  }

  @override
  void dispose() {
    super.dispose();
    _headlinesBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener(
      cubit: _headlinesBloc,
      listener: (context, state){
        if(state is HeadlineLoading){
          print("Esta cargando");
        }
        if(state is HeadlineSuccess){
          print("Cargo la data");
        }
        if(state is HeadlineError){
          print("Ocurrio un error: ${state.messageError}");
        }
      },
      child: BlocBuilder(
        cubit: _headlinesBloc,
        builder: (context, state){
          if(state is HeadlineLoading){
            return Center(child: CircularProgressIndicator());
          }
          if(state is HeadlineSuccess){
            return NewsList(state.headlines);
          }
          if(state is HeadlineError){
            return Center(child: Text("Ocurrio un error"));
          }
          return Container();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
