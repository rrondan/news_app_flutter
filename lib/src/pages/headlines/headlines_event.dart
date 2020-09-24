import 'package:equatable/equatable.dart';

abstract class HeadlinesEvent extends Equatable{
  const HeadlinesEvent();
  @override
  List<Object> get props => [];
}

class FetchHeadlines extends HeadlinesEvent{

}
