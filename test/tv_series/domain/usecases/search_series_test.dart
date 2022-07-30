import 'package:dartz/dartz.dart';

import 'package:ditonton/domain/entities/tv_series/series.dart';

import 'package:ditonton/domain/usecases/tv_series/search_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/tv_series/series_test_helper.mocks.dart';

void main() {
  late SearchTvSeriess usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = SearchTvSeriess(mockTvSeriesRepository);
  });

  final tTvSeriess = <TvSeries>[];
  final tQuery = 'Spiderman';

  test('should get list of TvSeriess from the repository', () async {
    // arrange
    when(mockTvSeriesRepository.searchTvSeriess(tQuery))
        .thenAnswer((_) async => Right(tTvSeriess));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tTvSeriess));
  });
}
