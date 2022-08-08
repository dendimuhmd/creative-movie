import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/usecases/get_popular_series.dart';
import 'package:tv_series/presentation/bloc/popular_series_bloc.dart';

import '../../../dummy_data/tv_series/dummy_objects.dart';
import 'popular_series_bloc_test.mocks.dart';

@GenerateMocks([GetPopularTvSeriess])
void main() {
  late MockGetPopularTvSeriess mockGetPopularTvSeriess;
  late PopularSeriesBloc popularSeriesBloc;

  setUp(() {
    mockGetPopularTvSeriess = MockGetPopularTvSeriess();
    popularSeriesBloc = PopularSeriesBloc(mockGetPopularTvSeriess);
  });

  group('Popular Movies', () {
    test('Initial state should be empty', () {
      expect(popularSeriesBloc.state, PopularTvSeriesEmpty());
    });

    blocTest<PopularSeriesBloc, PopularTvSeriesState>(
      'Should emit [PopularTvSeriesLoading, PopularTvSeriesLoaded] when data is gotten successfully',
      build: () {
        when(mockGetPopularTvSeriess.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));
        return popularSeriesBloc;
      },
      act: (bloc) => bloc.add(PopularSeriesEvent()),
      expect: () => [
        PopularTvSeriesLoading(),
        PopularTvSeriesLoaded(testTvSeriesList),
      ],
      verify: (bloc) {
        verify(mockGetPopularTvSeriess.execute());
      },
    );

    blocTest<PopularSeriesBloc, PopularTvSeriesState>(
      'Should emit [PopularTvSeriesLoading, PopularTvSeriesLoaded[], PopularTvSeriesEmpty] when data is gotten successfully',
      build: () {
        when(mockGetPopularTvSeriess.execute())
            .thenAnswer((_) async => Right(<TvSeries>[]));
        return popularSeriesBloc;
      },
      act: (bloc) => bloc.add(PopularSeriesEvent()),
      expect: () => [
        PopularTvSeriesLoading(),
        PopularTvSeriesLoaded(<TvSeries>[]),
        PopularTvSeriesEmpty(),
      ],
      verify: (bloc) {
        verify(mockGetPopularTvSeriess.execute());
      },
    );

    blocTest<PopularSeriesBloc, PopularTvSeriesState>(
      'Should emit [PopularTvSeriesLoading, PopularTvSeriesError] when get Failure',
      build: () {
        when(mockGetPopularTvSeriess.execute())
            .thenAnswer((_) async => Left(ServerFailure('Failed')));
        return popularSeriesBloc;
      },
      act: (bloc) => bloc.add(PopularSeriesEvent()),
      expect: () => [
        PopularTvSeriesLoading(),
        PopularTvSeriesError('Failed'),
      ],
      verify: (_) {
        verify(mockGetPopularTvSeriess.execute());
      },
    );
  });
}
