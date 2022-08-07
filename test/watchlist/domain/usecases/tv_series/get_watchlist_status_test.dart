import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/domain/usecases/tv_series/get_watchlist_status_series.dart';

import '../../../../core/tv_series/helpers_series/series_test_helper.mocks.dart';

void main() {
  late GetWatchListStatusTvSeries usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetWatchListStatusTvSeries(mockTvSeriesRepository);
  });

  test('should get watchlist status from repository', () async {
    // arrange
    when(mockTvSeriesRepository.isAddedToWatchlist(1))
        .thenAnswer((_) async => true);
    // act
    final result = await usecase.execute(1);
    // assert
    expect(result, true);
  });
}
