import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_now_playing_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_popular_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_top_rated_series.dart';
import 'package:ditonton/presentation/provider/tv_series/series_list_notifier.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

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
      originalName: "2 Good 2 Be True",
      posterPath: "/2Wf5ySCPcnp8lRhbSD7jt0YLz5A.jpg",
      id: 135647,
      overview:
          "After the mysterious disappearance of his father, Joventino, the cowboy José Leôncio becomes a wealthy farm owner in Pantanal. Over twenty years have passed and, bitter-hearted because of his father vanishing and the escape of his wife to Rio de Janeiro with his baby, José Leôncio has the chance to make amends with the boy, now a young man raised in the big city with very different values and habits than his own.",
      popularity: 943.32,
      genreIds: [35, 18],
      backdropPath: "/sIRK4NYe1OK2hOJAg4xxuxzceKk.jpg",
      voteAverage: 7.5,
      voteCount: 102);
  final tTvSeriesList = <TvSeries>[tTvSeries];

  group('now playing TvSeriess', () {
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

    test('should change TvSeriess when data is gotten successfully', () async {
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

  group('popular TvSeriess', () {
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

    test('should change TvSeriess data when data is gotten successfully',
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

  group('top rated TvSeriess', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedTvSeriess.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      // act
      provider.fetchTopRatedTvSeriess();
      // assert
      expect(provider.topRatedTvSeriessState, RequestState.Loading);
    });

    test('should change TvSeriess data when data is gotten successfully',
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
