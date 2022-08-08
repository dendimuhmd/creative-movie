import 'package:core/domain/entities/tv_series/series.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/usecases/get_now_playing_series.dart';

import '../../helpers/series_helper.mocks.dart';

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
