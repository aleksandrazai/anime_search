part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  SearchLoaded({
    required this.title,
  });
  final List<String> title;

  @override
  List<Object> get props => super.props..add(title);
}

class SearchNotFound extends SearchState {}

class SearchFailed extends SearchState {
  SearchFailed({required this.error});
  final Object error;
}
