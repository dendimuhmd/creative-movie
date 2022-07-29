import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:ditonton/domain/usecases/tv_series/get_watchlist_series.dart';
import 'package:ditonton/presentation/provider/movie/watchlist_movie_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series/watchlist_series_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([GetWatchlistTvSeries])
void main() {
  late WatchlistTvSeriesNotifier provider;
  late MockGetWatchlistTvSeries mockGetWatchlistTvSeriess;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetWatchlistTvSeriess = MockGetWatchlistTvSeriess();
    provider = WatchlistTvSeriesNotifier(
      getWatchlistTvSeriess: mockGetWatchlistTvSeriess,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockGetWatchlistTvSeriess.execute())
        .thenAnswer((_) async => Right([testWatchlistTvSeries]));
    // act
    await provider.fetchWatchlistTvSeriess();
    // assert
    expect(provider.watchlistState, RequestState.Loaded);
    expect(provider.watchlistTvSeriess, [testWatchlistTvSeries]);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetWatchlistTvSeriess.execute())
        .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
    // act
    await provider.fetchWatchlistTvSeriess();
    // assert
    expect(provider.watchlistState, RequestState.Error);
    expect(provider.message, "Can't get data");
    expect(listenerCallCount, 2);
  });
}
