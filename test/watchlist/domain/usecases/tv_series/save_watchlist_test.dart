import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/domain/usecases/tv_series/save_watchlist_series.dart';

import '../../../../core/dummy_data/tv_series/dummy_objects.dart';
import '../../../../core/tv_series/helpers_series/series_test_helper.mocks.dart';

void main() {
  late SaveWatchlistTvSeries usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = SaveWatchlistTvSeries(mockTvSeriesRepository);
  });

  test('should save TvSeries to the repository', () async {
    // arrange
    when(mockTvSeriesRepository.saveWatchlist(testTvSeriesDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testTvSeriesDetail);
    // assert
    verify(mockTvSeriesRepository.saveWatchlist(testTvSeriesDetail));
    expect(result, Right('Added to Watchlist'));
  });
}
