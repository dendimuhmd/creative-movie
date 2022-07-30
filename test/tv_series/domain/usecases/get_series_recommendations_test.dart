import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series/series.dart';

import 'package:ditonton/domain/usecases/tv_series/get_series_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/tv_series/series_test_helper.mocks.dart';

void main() {
  late GetTvSeriesRecommendations usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetTvSeriesRecommendations(mockTvSeriesRepository);
  });

  final tId = 1;
  final tTvSeriess = <TvSeries>[];

  test('should get list of TvSeries recommendations from the repository',
      () async {
    // arrange
    when(mockTvSeriesRepository.getTvSeriesRecommendations(tId))
        .thenAnswer((_) async => Right(tTvSeriess));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(tTvSeriess));
  });
}
