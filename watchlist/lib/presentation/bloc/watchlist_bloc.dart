import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:equatable/equatable.dart';
import 'package:watchlist/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:watchlist/domain/usecases/tv_series/get_watchlist_series.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistMovieBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final GetWatchlistMovies _getWatchlistMovies;
  WatchlistMovieBloc(this._getWatchlistMovies) : super(WatchlistEmpty('')) {
    on<WatchlistEvent>((event, emit) async {
      emit(WatchlistLoading());
      final result = await _getWatchlistMovies.execute();
      result.fold((failure) => emit(WatchlistError(failure.message)),
          (moviesData) {
        emit(WatchlistHasData<Movie>(moviesData));
        if (moviesData.isEmpty) {
          emit(WatchlistEmpty('You haven\'t added a watch list'));
        }
      });
    });
  }
}

class WatchlistSeriesBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final GetWatchlistTvSeries _getWatchlistTvSeries;
  WatchlistSeriesBloc(this._getWatchlistTvSeries) : super(WatchlistEmpty('')) {
    on<WatchlistEvent>((event, emit) async {
      emit(WatchlistLoading());
      final result = await _getWatchlistTvSeries.execute();
      result.fold((failure) => emit(WatchlistError(failure.message)),
          (tvShowsData) {
        emit(WatchlistHasData<TvSeries>(tvShowsData));
        if (tvShowsData.isEmpty) {
          emit(WatchlistEmpty('You haven\'t added a watch list'));
        }
      });
    });
  }
}
