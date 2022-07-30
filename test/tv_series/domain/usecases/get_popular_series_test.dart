import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series/series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_popular_series.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';
import '../../../helpers/tv_series/series_test_helper.mocks.dart';

void main() {
  late GetPopularTvSeriess usecase;
  late MockTvSeriesRepository mockTvSeriesRpository;

  setUp(() {
    mockTvSeriesRpository = MockTvSeriesRepository();
    usecase = GetPopularTvSeriess(mockTvSeriesRpository);
  });

  final tTvSeriess = <TvSeries>[];

  group('GetPopularTvSeriess Tests', () {
    group('execute', () {
      test(
          'should get list of TvSeriess from the repository when execute function is called',
          () async {
        // arrange
        when(mockTvSeriesRpository.getPopularTvSeriess())
            .thenAnswer((_) async => Right(tTvSeriess));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tTvSeriess));
      });
    });
  });
}
