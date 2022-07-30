import 'package:dartz/dartz.dart';

import 'package:ditonton/domain/entities/tv_series/series.dart';

import 'package:ditonton/domain/usecases/tv_series/get_now_playing_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/tv_series/series_test_helper.mocks.dart';

void main() {
  late GetNowPlayingTvSeriess usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetNowPlayingTvSeriess(mockTvSeriesRepository);
  });

  final tTvSeriess = <TvSeries>[];

  test('should get list of TvSeriesss from the repository', () async {
    // arrange
    when(mockTvSeriesRepository.getNowPlayingTvSeriess())
        .thenAnswer((_) async => Right(tTvSeriess));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTvSeriess));
  });
}
