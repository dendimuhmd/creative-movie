import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv_series/get_series_detail.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/tv_series/series_test_helper.mocks.dart';
import '../../dummy_data_series/dummy_objects.dart';

void main() {
  late GetTvSeriesDetail usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetTvSeriesDetail(mockTvSeriesRepository);
  });

  final tId = 1;

  test('should get TvSeriess detail from the repository', () async {
    // arrange
    when(mockTvSeriesRepository.getTvSeriesDetail(tId))
        .thenAnswer((_) async => Right(testTvSeriesDetail));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(testTvSeriesDetail));
  });
}
