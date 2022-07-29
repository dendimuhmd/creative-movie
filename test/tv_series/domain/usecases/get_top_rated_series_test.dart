import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/entities/tv_series/series.dart';
import 'package:ditonton/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/tv_series/get_top_rated_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../helpers/tv_series/series_test_helper.mocks.dart';

void main() {
  late GetTopRatedTvSeriess usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetTopRatedTvSeriess(mockTvSeriesRepository);
  });

  final tTvSeriess = <TvSeries>[];

  test('should get list of movies from repository', () async {
    // arrange
    when(mockTvSeriesRepository.getTopRatedTvSeriess())
        .thenAnswer((_) async => Right(tTvSeriess));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTvSeriess));
  });
}
