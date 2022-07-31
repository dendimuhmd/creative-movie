import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv_series/get_watchlist_series.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/tv_series/series_test_helper.mocks.dart';
import '../../dummy_data_series/dummy_objects.dart';

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
