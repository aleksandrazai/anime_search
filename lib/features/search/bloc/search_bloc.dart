import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:search_filter_example/data/api_client/api_client.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_event.dart';
part 'search_state.dart';

EventTransformer<Event> debounceDroppable<Event>(Duration duration) {
  return (events, mapper) {
    return droppable<Event>().call(events.debounce(duration), mapper);
  };
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiClient apiClient;
  SearchBloc({required this.apiClient}) : super(SearchInitial()) {
    on<SearchAnimeEvent>(
      _onSearch,
      transformer: debounceDroppable(
        const Duration(seconds: 3),
      ),
    );
  }

  _onSearch(SearchAnimeEvent event, Emitter<SearchState> emit) async {
    if (event.query.length < 3) return;
    emit(SearchLoading());
    try {
      final result = await apiClient.getAnimeTitle(event.query);
      final data = result.data;
      final List<String> title =
          data?.map((anime) => anime.title ?? '').toList() ?? [];
      if (title.isNotEmpty) {
        emit(
          SearchLoaded(title: title),
        );
      }
      if (title.isEmpty) {
        emit(SearchNotFound());
      }
    } catch (e) {
      emit(SearchFailed(error: e));
    }
  }
}
