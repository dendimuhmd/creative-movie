import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';

import 'package:ditonton/domain/entities/tv_series/series.dart';

import 'package:ditonton/domain/usecases/tv_series/get_popular_series.dart';

import 'package:ditonton/presentation/provider/tv_series/popular_series_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'popular_series_notifier_test.mocks.dart';

@GenerateMocks([GetPopularTvSeriess])
void main() {
  late MockGetPopularTvSeriess mockGetPopularTvSeriess;
  late PopularTvSeriessNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetPopularTvSeriess = MockGetPopularTvSeriess();
    notifier = PopularTvSeriessNotifier(mockGetPopularTvSeriess)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  final tTvSeries = TvSeries(
      originalName: "2 Good 2 Be True",
      posterPath: "/2Wf5ySCPcnp8lRhbSD7jt0YLz5A.jpg",
      id: 135647,
      overview:
          "Car mechanic Eloy makes a terrible first impression on Ali, who works for a real estate magnate. But both of them are hiding their true personas.",
      popularity: 943.32,
      genreIds: [35, 18],
      backdropPath: "/sIRK4NYe1OK2hOJAg4xxuxzceKk.jpg",
      voteAverage: 7.5,
      voteCount: 102);

  final tTvSeriesList = <TvSeries>[tTvSeries];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetPopularTvSeriess.execute())
        .thenAnswer((_) async => Right(tTvSeriesList));
    // act
    notifier.fetchPopularTvSeriess();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change TvSeriess data when data is gotten successfully',
      () async {
    // arrange
    when(mockGetPopularTvSeriess.execute())
        .thenAnswer((_) async => Right(tTvSeriesList));
    // act
    await notifier.fetchPopularTvSeriess();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.tvSeriess, tTvSeriesList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetPopularTvSeriess.execute())
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchPopularTvSeriess();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
