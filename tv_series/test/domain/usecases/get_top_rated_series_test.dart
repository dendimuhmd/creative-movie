import 'package:core/domain/entities/tv_series/series.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/usecases/get_top_rated_series.dart';

import '../../helpers/series_helper.mocks.dart';

void main() {
  late GetTopRatedTvSeriess usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetTopRatedTvSeriess(mockTvSeriesRepository);
  });

  final tTvSeriess = <TvSeries>[];

  test('should get list of TvSeriess from repository', () async {
    // arrange
    when(mockTvSeriesRepository.getTopRatedTvSeriess())
        .thenAnswer((_) async => Right(tTvSeriess));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTvSeriess));
  });
}
