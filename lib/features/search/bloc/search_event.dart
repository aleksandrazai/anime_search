part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchAnimeEvent extends SearchEvent {
  SearchAnimeEvent({required this.query});
  final String query;

  @override
  List<Object> get props => super.props..addAll([query]);
}
