import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/movie/save_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/tv_series/series_test_helper.mocks.dart';

void main() {
  late SaveWatchlist usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = SaveWatchlist(mockTvSeriesRepository);
  });

  test('should save movie to the repository', () async {
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
