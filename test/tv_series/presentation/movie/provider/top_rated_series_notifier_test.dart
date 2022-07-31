import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_top_rated_series.dart';
import 'package:ditonton/presentation/provider/tv_series/top_rated_series_notifier.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([GetTopRatedTvSeriess])
void main() {
  late MockGetTopRatedTvSeriess mockGetTopRatedTvSeriess;
  late TopRatedTvSeriessNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTopRatedTvSeriess = MockGetTopRatedTvSeriess();
    notifier = TopRatedTvSeriessNotifier(
        getTopRatedTvSeriess: mockGetTopRatedTvSeriess)
      ..addListener(() {
        listenerCallCount++;
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

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetTopRatedTvSeriess.execute())
        .thenAnswer((_) async => Right(tTvSeriesList));
    // act
    notifier.fetchTopRatedTvSeriess();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change TvSeriess data when data is gotten successfully',
      () async {
    // arrange
    when(mockGetTopRatedTvSeriess.execute())
        .thenAnswer((_) async => Right(tTvSeriesList));
    // act
    await notifier.fetchTopRatedTvSeriess();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.tvSeriess, tTvSeriesList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetTopRatedTvSeriess.execute())
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchTopRatedTvSeriess();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
