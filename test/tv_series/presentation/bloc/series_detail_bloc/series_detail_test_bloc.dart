import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:tv_series/domain/usecases/get_series_detail.dart';
import 'package:tv_series/domain/usecases/get_series_recommendations.dart';
import 'package:tv_series/presentation/bloc/series_detail_bloc.dart';
import 'package:watchlist/domain/usecases/tv_series/get_watchlist_status_series.dart';
import 'package:watchlist/domain/usecases/tv_series/remove_watchlist_series.dart';
import 'package:watchlist/domain/usecases/tv_series/save_watchlist_series.dart';

import '../../../../core/dummy_data/tv_series/dummy_objects.dart';
import 'series_detail_test_bloc.mocks.dart';

@GenerateMocks([
  GetTvSeriesDetail,
  GetTvSeriesRecommendations,
  GetWatchListStatusTvSeries,
  SaveWatchlistTvSeries,
  RemoveWatchlistTvSeries
])
void main() {
  late SeriesDetailBloc seriesDetailBloc;
  late MockGetWatchListStatusTvSeries mockGetWatchListStatusTvSeries;
  late MockGetTvSeriesDetail mockGetTvSeriesDetail;
  late MockGetTvSeriesRecommendations mockGetTvSeriesRecommendations;
  late MockSaveWatchlistTvSeries mockSaveWatchlistTvSeries;
  late MockRemoveWatchlistTvSeries mockRemoveWatchlistTvSeries;

  setUp(() {
    seriesDetailBloc = SeriesDetailBloc(
        mockGetTvSeriesDetail,
        mockGetTvSeriesRecommendations,
        mockGetWatchListStatusTvSeries,
        mockRemoveWatchlistTvSeries,
        mockSaveWatchlistTvSeries);
    mockGetWatchListStatusTvSeries = MockGetWatchListStatusTvSeries();
    mockGetTvSeriesDetail = MockGetTvSeriesDetail();
    mockGetTvSeriesRecommendations = MockGetTvSeriesRecommendations();
    mockSaveWatchlistTvSeries = MockSaveWatchlistTvSeries();
    mockRemoveWatchlistTvSeries = MockRemoveWatchlistTvSeries();
  });

  final tId = 1;
  final seriesDetailStateInitial = SeriesDetailState.initial();

  group('Get Series Detail', () {
    blocTest<SeriesDetailBloc, SeriesDetailState>(
      'Emit Loading',
      build: () {
        when(mockGetTvSeriesDetail.execute(tId))
            .thenAnswer((_) async => Right(testTvSeriesDetail));
        when(mockGetTvSeriesRecommendations.execute(tId))
            .thenAnswer((_) async => Right(testTvSeriesList));
        return seriesDetailBloc;
      },
      act: (bloc) => bloc.add(FetchTvSeriesDetail(tId)),
      expect: () => [
        seriesDetailStateInitial.copyWith(
            tvSeriesDetailState: RequestState.Loading),
        seriesDetailStateInitial.copyWith(
          tvSeriesState: RequestState.Loaded,
          tvSeriesDetail: testTvSeriesDetail,
          tvSeriesDetailState: RequestState.Loaded,
          message: '',
        ),
        seriesDetailStateInitial.copyWith(
            tvSeriesDetailState: RequestState.Loading),
        seriesDetailStateInitial.copyWith(
          tvSeriesState: RequestState.Loaded,
          tvSeriesDetail: testTvSeriesDetail,
          tvSeriesDetailState: RequestState.Loaded,
          tvSeries: testTvSeriesList,
          message: '',
        )
      ],
      verify: (_) {
        verify(mockGetTvSeriesDetail.execute(tId));
        verify(mockGetTvSeriesRecommendations.execute(tId));
      },
    );
    blocTest<SeriesDetailBloc, SeriesDetailState>(
      'Emit Loading',
      build: () {
        when(mockGetTvSeriesDetail.execute(tId))
            .thenAnswer((_) async => Right(testTvSeriesDetail));
        when(mockGetTvSeriesRecommendations.execute(tId))
            .thenAnswer((_) async => Right(testTvSeriesList));
        return seriesDetailBloc;
      },
      act: (bloc) => bloc.add(FetchTvSeriesDetail(tId)),
      expect: () => [
        seriesDetailStateInitial.copyWith(
            tvSeriesDetailState: RequestState.Loading),
        seriesDetailStateInitial.copyWith(
          tvSeriesState: RequestState.Loaded,
          tvSeriesDetail: testTvSeriesDetail,
          tvSeriesDetailState: RequestState.Loaded,
          message: '',
        ),
        seriesDetailStateInitial.copyWith(
            tvSeriesDetailState: RequestState.Loading),
        seriesDetailStateInitial.copyWith(
          tvSeriesState: RequestState.Loaded,
          tvSeriesDetail: testTvSeriesDetail,
          tvSeriesDetailState: RequestState.Loaded,
          tvSeries: testTvSeriesList,
          message: 'Failed',
        )
      ],
      verify: (_) {
        verify(mockGetTvSeriesDetail.execute(tId));
        verify(mockGetTvSeriesRecommendations.execute(tId));
      },
    );
  });

  group('Add watchlist Series', () {
    blocTest<SeriesDetailBloc, SeriesDetailState>(
        'Give return message and is added to watchlist true when success',
        build: () {
      when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail))
          .thenAnswer((realInvocation) async => Right('Added to watchlist'));
      when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id))
          .thenAnswer((realInvocation) async => true);
      return seriesDetailBloc;
    });
  });
}
