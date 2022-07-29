import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/entities/tv_series/series.dart';
import 'package:ditonton/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/movie/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/tv_series/get_now_playing_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_popular_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_top_rated_series.dart';
import 'package:ditonton/presentation/provider/movie/movie_list_notifier.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_series/series_list_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'popular_series_notifier_test.mocks.dart';
import 'series_list_notifier_test.mocks.dart';
import 'top_rated_series_notifier_test.mocks.dart';

@GenerateMocks(
    [GetNowPlayingTvSeriess, GetPopularTvSeriess, GetTopRatedTvSeriess])
void main() {
  late TvSeriesListNotifier provider;
  late MockGetNowPlayingTvSeriess mockGetNowPlayingTvSeriess;
  late MockGetPopularTvSeriess mockGetPopularTvSeriess;
  late MockGetTopRatedTvSeriess mockGetTopRatedTvSeriess;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetNowPlayingTvSeriess = MockGetNowPlayingTvSeriess();
    mockGetPopularTvSeriess = MockGetPopularTvSeriess();
    mockGetTopRatedTvSeriess = MockGetTopRatedTvSeriess();
    provider = TvSeriesListNotifier(
      getNowPlayingTvSeriess: mockGetNowPlayingTvSeriess,
      getPopularTvSeriess: mockGetPopularTvSeriess,
      getTopRatedTvSeriess: mockGetTopRatedTvSeriess,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tTvSeries = TvSeries(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );
  final tTvSeriesList = <TvSeries>[tTvSeries];

  group('now playing movies', () {
    test('initialState should be Empty', () {
      expect(provider.nowPlayingState, equals(RequestState.Empty));
    });

    test('should get data from the usecase', () async {
      // arrange
      when(mockGetNowPlayingTvSeriess.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      // act
      provider.fetchNowPlayingTvSeriess();
      // assert
      verify(mockGetNowPlayingTvSeriess.execute());
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      when(mockGetNowPlayingTvSeriess.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      // act
      provider.fetchNowPlayingTvSeriess();
      // assert
      expect(provider.nowPlayingState, RequestState.Loading);
    });

    test('should change movies when data is gotten successfully', () async {
      // arrange
      when(mockGetNowPlayingTvSeriess.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      // act
      await provider.fetchNowPlayingTvSeriess();
      // assert
      expect(provider.nowPlayingState, RequestState.Loaded);
      expect(provider.nowPlayingTvSeriess, tTvSeriesList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetNowPlayingTvSeriess.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchNowPlayingTvSeriess();
      // assert
      expect(provider.nowPlayingState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('popular movies', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularTvSeriess.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      // act
      provider.fetchPopularTvSeriess();
      // assert
      expect(provider.popularTvSeriessState, RequestState.Loading);
      // verify(provider.setState(RequestState.Loading));
    });

    test('should change movies data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetPopularTvSeriess.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      // act
      await provider.fetchPopularTvSeriess();
      // assert
      expect(provider.popularTvSeriessState, RequestState.Loaded);
      expect(provider.popularTvSeriess, tTvSeriesList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularTvSeriess.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchPopularTvSeriess();
      // assert
      expect(provider.popularTvSeriessState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('top rated movies', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedTvSeriess.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      // act
      provider.fetchTopRatedTvSeriess();
      // assert
      expect(provider.topRatedTvSeriessState, RequestState.Loading);
    });

    test('should change movies data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTopRatedTvSeriess.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      // act
      await provider.fetchTopRatedTvSeriess();
      // assert
      expect(provider.topRatedTvSeriessState, RequestState.Loaded);
      expect(provider.topRatedTvSeriess, tTvSeriesList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedTvSeriess.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTopRatedTvSeriess();
      // assert
      expect(provider.topRatedTvSeriessState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
