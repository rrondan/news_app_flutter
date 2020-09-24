import 'package:equatable/equatable.dart';

abstract class HeadlinesCategoryEvent extends Equatable{
  const HeadlinesCategoryEvent();
  @override
  List<Object> get props => [];
}

class FetchHeadlinesCategory extends HeadlinesCategoryEvent{
  final String selectedCategory;

  FetchHeadlinesCategory(this.selectedCategory);

  @override
  List<Object> get props => [selectedCategory];
}
