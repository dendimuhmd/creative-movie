import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/usecases/get_top_rated_series.dart';
import 'package:tv_series/presentation/bloc/top_rated_series_bloc.dart';

import '../../../../core/dummy_data/tv_series/dummy_objects.dart';
import 'top_rated_series_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedTvSeriess])
void main() {
  late TopRatedSeriesBloc topRatedSeriesBloc;
  late MockGetTopRatedTvSeriess mockGetTopRatedTvSeriess;

  setUp(() {
    mockGetTopRatedTvSeriess = MockGetTopRatedTvSeriess();
    topRatedSeriesBloc = TopRatedSeriesBloc(mockGetTopRatedTvSeriess);
  });

  group('Top Rated Series', () {
    test('Initial state should be empty', () {
      expect(topRatedSeriesBloc.state, TopRatedSeriesEmpty());
    });

    blocTest<TopRatedSeriesBloc, TopRatedSeriesState>(
      'Should emit [TopRatedSeriesLoading, TopRatedSeriesLoaded] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedTvSeriess.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));
        return topRatedSeriesBloc;
      },
      act: (bloc) => bloc.add(TopRatedSeriesEvent()),
      expect: () => [
        TopRatedSeriesLoading(),
        TopRatedSeriesLoaded(testTvSeriesList),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedTvSeriess.execute());
      },
    );

    blocTest<TopRatedSeriesBloc, TopRatedSeriesState>(
      'Should emit [TopRatedSeriesLoading, TopRatedSeriesLoaded[], TopRatedEmpty] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedTvSeriess.execute())
            .thenAnswer((_) async => Right(<TvSeries>[]));
        return topRatedSeriesBloc;
      },
      act: (bloc) => bloc.add(TopRatedSeriesEvent()),
      expect: () => [
        TopRatedSeriesLoading(),
        TopRatedSeriesLoaded(<TvSeries>[]),
        TopRatedSeriesEmpty(),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedTvSeriess.execute());
      },
    );

    blocTest<TopRatedSeriesBloc, TopRatedSeriesState>(
      'Should emit [TopRatedSeriesLoading, TopRatedSeriesError] when get Failure',
      build: () {
        when(mockGetTopRatedTvSeriess.execute())
            .thenAnswer((_) async => Left(ServerFailure('Failed')));
        return topRatedSeriesBloc;
      },
      act: (bloc) => bloc.add(TopRatedSeriesEvent()),
      expect: () => [
        TopRatedSeriesLoading(),
        TopRatedSeriesError('Failed'),
      ],
      verify: (_) {
        verify(mockGetTopRatedTvSeriess.execute());
      },
    );
  });
}
