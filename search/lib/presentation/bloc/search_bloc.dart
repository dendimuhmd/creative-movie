import 'package:bloc/bloc.dart';

import 'package:core/domain/entities/movie/movie.dart';
import 'package:core/domain/entities/tv_series/series.dart';

import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search/domain/usecases/search_movies.dart';

import '../../domain/usecases/search_series.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchMovieBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies searchMovies;
  SearchMovieBloc(this.searchMovies) : super(SearchEmpty('')) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;
      emit(SearchLoading());
      final result = await searchMovies.execute(query);
      result.fold((failure) => emit(SearchError(failure.message)),
          (moviesData) {
        emit(SearchHasData<Movie>(moviesData));
        if (moviesData.isEmpty) {
          emit(SearchEmpty('No Result Found'));
        }
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

class SearchTvSeriesBloc extends Bloc<SearchEvent, SearchState> {
  final SearchTvSeriess _searchTvShows;
  SearchTvSeriesBloc(this._searchTvShows) : super(SearchEmpty('')) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;
      emit(SearchLoading());
      final result = await _searchTvShows.execute(query);
      result.fold((failure) => emit(SearchError(failure.message)),
          (tvSeriesData) {
        emit(SearchHasData<TvSeries>(tvSeriesData));
        if (tvSeriesData.isEmpty) {
          emit(SearchEmpty('No Result Found'));
        }
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
