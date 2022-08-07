import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:watchlist/domain/usecases/tv_series/get_watchlist_series.dart';
import 'package:watchlist/presentation/bloc/watchlist_bloc.dart';

import '../../../core/dummy_data/movie/dummy_objects.dart';
import '../../../core/dummy_data/tv_series/dummy_objects.dart';
import 'watchlist_block_test.mocks.dart';

@GenerateMocks([GetWatchlistMovies, GetWatchlistTvSeries])
void main() {
  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late MockGetWatchlistTvSeries mockGetWatchlistTvSeries;
  late WatchlistMovieBloc watchlistMovieBloc;
  late WatchlistSeriesBloc watchlistSeriesBloc;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    mockGetWatchlistTvSeries = MockGetWatchlistTvSeries();
    watchlistMovieBloc = WatchlistMovieBloc(mockGetWatchlistMovies);
    watchlistSeriesBloc = WatchlistSeriesBloc(mockGetWatchlistTvSeries);
  });

  group('Watchlist Movie', () {
    test('Initial state should be empty', () {
      expect(watchlistMovieBloc.state, WatchlistEmpty(''));
    });

    blocTest<WatchlistMovieBloc, WatchlistState>(
      'Should emit [WatchlistLoading, WatchlistHasData] when data is gotten successfully',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));
        return watchlistMovieBloc;
      },
      act: (bloc) => bloc.add(WatchlistEvent()),
      expect: () => [
        WatchlistLoading(),
        WatchlistHasData(testMovieList),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistMovies.execute());
      },
    );

    blocTest<WatchlistMovieBloc, WatchlistState>(
      'Should emit [WatchlistLoading, WatchlistHasData[], WatchlistEmpty] when data is empty',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Right(<Movie>[]));
        return watchlistMovieBloc;
      },
      act: (bloc) => bloc.add(WatchlistEvent()),
      expect: () => [
        WatchlistLoading(),
        WatchlistHasData(<Movie>[]),
        WatchlistEmpty('You haven\'t added a watch list'),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistMovies.execute());
      },
    );

    blocTest<WatchlistMovieBloc, WatchlistState>(
      'Should emit [WatchlistLoading, WatchlistError] when data is unsuccessful',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return watchlistMovieBloc;
      },
      act: (bloc) => bloc.add(WatchlistEvent()),
      expect: () => [
        WatchlistLoading(),
        WatchlistError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistMovies.execute());
      },
    );
  });

  group('Watchlist Series', () {
    test('Initial state should be empty', () {
      expect(watchlistMovieBloc.state, WatchlistEmpty(''));
    });

    blocTest<WatchlistSeriesBloc, WatchlistState>(
      'Should emit [WatchlistLoading, WatchlistHasData] when data is gotten successfully',
      build: () {
        when(mockGetWatchlistTvSeries.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));
        return watchlistSeriesBloc;
      },
      act: (bloc) => bloc.add(WatchlistEvent()),
      expect: () => [
        WatchlistLoading(),
        WatchlistHasData(testTvSeriesList),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistTvSeries.execute());
      },
    );

    blocTest<WatchlistSeriesBloc, WatchlistState>(
      'Should emit [WatchlistLoading, WatchlistHasData[], WatchlistEmpty] when data is empty',
      build: () {
        when(mockGetWatchlistTvSeries.execute())
            .thenAnswer((_) async => Right(<TvSeries>[]));
        return watchlistSeriesBloc;
      },
      act: (bloc) => bloc.add(WatchlistEvent()),
      expect: () => [
        WatchlistLoading(),
        WatchlistHasData(<TvSeries>[]),
        WatchlistEmpty('You haven\'t added a watch list'),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistTvSeries.execute());
      },
    );

    blocTest<WatchlistSeriesBloc, WatchlistState>(
      'Should emit [WatchlistLoading, WatchlistError] when data is unsuccessful',
      build: () {
        when(mockGetWatchlistTvSeries.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return watchlistSeriesBloc;
      },
      act: (bloc) => bloc.add(WatchlistEvent()),
      expect: () => [
        WatchlistLoading(),
        WatchlistError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistTvSeries.execute());
      },
    );
  });
}
