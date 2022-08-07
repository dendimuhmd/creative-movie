import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/domain/usecases/tv_series/get_watchlist_series.dart';

import '../../../../core/dummy_data/tv_series/dummy_objects.dart';
import '../../../../core/tv_series/helpers_series/series_test_helper.mocks.dart';

void main() {
  late GetWatchlistTvSeries usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetWatchlistTvSeries(mockTvSeriesRepository);
  });

  test('should get list of TvSeriess from the repository', () async {
    // arrange
    when(mockTvSeriesRepository.getWatchlistTvSeriess())
        .thenAnswer((_) async => Right(testTvSeriesList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(testTvSeriesList));
  });
}
