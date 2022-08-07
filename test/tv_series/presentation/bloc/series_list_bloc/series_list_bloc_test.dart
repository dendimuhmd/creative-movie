import 'package:bloc_test/bloc_test.dart';

import 'package:dartz/dartz.dart';

import 'package:core/common/failure.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/usecases/get_now_playing_series.dart';
import 'package:tv_series/presentation/bloc/series_list_bloc.dart';

import '../../../../core/dummy_data/tv_series/dummy_objects.dart';
import '../popular_series_bloc/popular_series_bloc_test.mocks.dart';
import '../top_rated_series/top_rated_series_bloc_test.mocks.dart';
import 'series_list_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingTvSeriess])
void main() {
  late SeriesListBloc seriesListBloc;
  late MockGetNowPlayingTvSeriess mockGetNowPlayingTvSeriess;
  late PopularSeriesListBloc popularSeriesListBloc;
  late MockGetPopularTvSeriess mockGetPopularTvSeriess;
  late TopRatedSeriesListBloc topRatedSeriesListBloc;
  late MockGetTopRatedTvSeriess mockGetTopRatedTvSeriess;

  setUp(() {
    mockGetNowPlayingTvSeriess = MockGetNowPlayingTvSeriess();
    seriesListBloc = SeriesListBloc(mockGetNowPlayingTvSeriess);
    mockGetPopularTvSeriess = MockGetPopularTvSeriess();
    popularSeriesListBloc = PopularSeriesListBloc(mockGetPopularTvSeriess);
    mockGetTopRatedTvSeriess = MockGetTopRatedTvSeriess();
    topRatedSeriesListBloc = TopRatedSeriesListBloc(mockGetTopRatedTvSeriess);
  });

  group('now playing movie list', () {
    test('Initial state should be empty', () {
      expect(seriesListBloc.state, SeriesListEmpty());
    });

    blocTest<SeriesListBloc, SeriesListState>(
      'Should emit [SeriesListLoading, SeriesListLoaded] when data is gotten successfully',
      build: () {
        when(mockGetNowPlayingTvSeriess.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));
        return seriesListBloc;
      },
      act: (bloc) => bloc.add(SeriesListEvent()),
      expect: () => [
        SeriesListLoading(),
        SeriesListLoaded(testTvSeriesList),
      ],
      verify: (bloc) {
        verify(mockGetNowPlayingTvSeriess.execute());
      },
    );

    blocTest<SeriesListBloc, SeriesListState>(
      'Should emit [SeriesListLoading, SeriesListError] when get Failure',
      build: () {
        when(mockGetNowPlayingTvSeriess.execute())
            .thenAnswer((_) async => Left(ServerFailure('Failed')));
        return seriesListBloc;
      },
      act: (bloc) => bloc.add(SeriesListEvent()),
      expect: () => [
        SeriesListLoading(),
        SeriesListError('Failed'),
      ],
      verify: (_) {
        verify(mockGetNowPlayingTvSeriess.execute());
      },
    );
  });

  group('popular movie list', () {
    test('Initial state should be empty', () {
      expect(popularSeriesListBloc.state, SeriesListEmpty());
    });

    blocTest<PopularSeriesListBloc, SeriesListState>(
      'Should emit [SeriesListLoading, SeriesListLoaded] when data is gotten successfully',
      build: () {
        when(mockGetPopularTvSeriess.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));
        return popularSeriesListBloc;
      },
      act: (bloc) => bloc.add(SeriesListEvent()),
      expect: () => [
        SeriesListLoading(),
        SeriesListLoaded(testTvSeriesList),
      ],
      verify: (bloc) {
        verify(mockGetPopularTvSeriess.execute());
      },
    );

    blocTest<PopularSeriesListBloc, SeriesListState>(
      'Should emit [SeriesListLoading, SeriesListError] when get Failure',
      build: () {
        when(mockGetPopularTvSeriess.execute())
            .thenAnswer((_) async => Left(ServerFailure('Failed')));
        return popularSeriesListBloc;
      },
      act: (bloc) => bloc.add(SeriesListEvent()),
      expect: () => [
        SeriesListLoading(),
        SeriesListError('Failed'),
      ],
      verify: (_) {
        verify(mockGetPopularTvSeriess.execute());
      },
    );
  });

  group('top rated movie list', () {
    test('Initial state should be empty', () {
      expect(topRatedSeriesListBloc.state, SeriesListEmpty());
    });

    blocTest<TopRatedSeriesListBloc, SeriesListState>(
      'Should emit [SeriesListLoading, SeriesListLoaded] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedTvSeriess.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));
        return topRatedSeriesListBloc;
      },
      act: (bloc) => bloc.add(SeriesListEvent()),
      expect: () => [
        SeriesListLoading(),
        SeriesListLoaded(testTvSeriesList),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedTvSeriess.execute());
      },
    );

    blocTest<TopRatedSeriesListBloc, SeriesListState>(
      'Should emit [SeriesListLoading, SeriesListError] when get Failure',
      build: () {
        when(mockGetTopRatedTvSeriess.execute())
            .thenAnswer((_) async => Left(ServerFailure('Failed')));
        return topRatedSeriesListBloc;
      },
      act: (bloc) => bloc.add(SeriesListEvent()),
      expect: () => [
        SeriesListLoading(),
        SeriesListError('Failed'),
      ],
      verify: (_) {
        verify(mockGetTopRatedTvSeriess.execute());
      },
    );
  });
}
