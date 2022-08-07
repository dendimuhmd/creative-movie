import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';

import 'package:dartz/dartz.dart';

import 'package:tv_series/domain/usecases/get_series_detail.dart';
import 'package:tv_series/domain/usecases/get_series_recommendations.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/presentation/bloc/series_detail_bloc.dart';
import 'package:watchlist/domain/usecases/tv_series/get_watchlist_status_series.dart';
import 'package:watchlist/domain/usecases/tv_series/remove_watchlist_series.dart';
import 'package:watchlist/domain/usecases/tv_series/save_watchlist_series.dart';

import '../../../../core/dummy_data/tv_series/dummy_objects.dart';
import 'series_detail_bloc_test.mocks.dart';

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
    mockGetTvSeriesDetail = MockGetTvSeriesDetail();
    mockGetTvSeriesRecommendations = MockGetTvSeriesRecommendations();
    mockGetWatchListStatusTvSeries = MockGetWatchListStatusTvSeries();
    mockSaveWatchlistTvSeries = MockSaveWatchlistTvSeries();
    mockRemoveWatchlistTvSeries = MockRemoveWatchlistTvSeries();
    seriesDetailBloc = SeriesDetailBloc(
        mockGetTvSeriesDetail,
        mockGetTvSeriesRecommendations,
        mockGetWatchListStatusTvSeries,
        mockRemoveWatchlistTvSeries,
        mockSaveWatchlistTvSeries);
  });

  final tId = 1;
  final seriesDetailStateInitial = SeriesDetailState.initial();

  group('Get Series Detail', () {
    blocTest<SeriesDetailBloc, SeriesDetailState>(
      'Shoud emit SeriesDetailLoading, RecomendationLoading, SeriesDetailLoaded and RecomendationLoaded when get  Detail Seriess and Recommendation Success',
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
          tvSeriesState: RequestState.Loading,
          tvSeriesDetail: testTvSeriesDetail,
          tvSeriesDetailState: RequestState.Loaded,
          message: '',
        ),
        seriesDetailStateInitial.copyWith(
          tvSeriesDetailState: RequestState.Loaded,
          tvSeriesDetail: testTvSeriesDetail,
          tvSeriesState: RequestState.Loaded,
          tvSeries: testTvSeriesList,
          message: '',
        ),
      ],
      verify: (_) {
        verify(mockGetTvSeriesDetail.execute(tId));
        verify(mockGetTvSeriesRecommendations.execute(tId));
      },
    );

    blocTest<SeriesDetailBloc, SeriesDetailState>(
      'Shoud emit SeriesDetailLoading, RecomendationLoading, SeriesDetailLoaded and RecommendationError when Get SeriesRecommendations Failed',
      build: () {
        when(mockGetTvSeriesDetail.execute(tId))
            .thenAnswer((_) async => Right(testTvSeriesDetail));
        when(mockGetTvSeriesRecommendations.execute(tId))
            .thenAnswer((_) async => Left(ConnectionFailure('Failed')));
        return seriesDetailBloc;
      },
      act: (bloc) => bloc.add(FetchTvSeriesDetail(tId)),
      expect: () => [
        seriesDetailStateInitial.copyWith(
            tvSeriesDetailState: RequestState.Loading),
        seriesDetailStateInitial.copyWith(
          tvSeriesState: RequestState.Loading,
          tvSeriesDetail: testTvSeriesDetail,
          tvSeriesDetailState: RequestState.Loaded,
          message: '',
        ),
        seriesDetailStateInitial.copyWith(
          tvSeriesDetailState: RequestState.Loaded,
          tvSeriesDetail: testTvSeriesDetail,
          tvSeriesState: RequestState.Error,
          message: 'Failed',
        ),
      ],
      verify: (_) {
        verify(mockGetTvSeriesDetail.execute(tId));
        verify(mockGetTvSeriesRecommendations.execute(tId));
      },
    );

    blocTest<SeriesDetailBloc, SeriesDetailState>(
      'Shoud emit SeriesDetailError when Get Series Detail Failed',
      build: () {
        when(mockGetTvSeriesDetail.execute(tId))
            .thenAnswer((_) async => Left(ConnectionFailure('Failed')));
        when(mockGetTvSeriesRecommendations.execute(tId))
            .thenAnswer((_) async => Right(testTvSeriesList));
        return seriesDetailBloc;
      },
      act: (bloc) => bloc.add(FetchTvSeriesDetail(tId)),
      expect: () => [
        seriesDetailStateInitial.copyWith(
            tvSeriesDetailState: RequestState.Loading),
        seriesDetailStateInitial.copyWith(
            tvSeriesDetailState: RequestState.Error, message: 'Failed'),
      ],
      verify: (_) {
        verify(mockGetTvSeriesDetail.execute(tId));
        verify(mockGetTvSeriesRecommendations.execute(tId));
      },
    );
  });

  group('Add watchlist Series', () {
    blocTest<SeriesDetailBloc, SeriesDetailState>(
      'Shoud emit WatchlistMessage and isAddedToWatchlist True when Success AddWatchlist',
      build: () {
        when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail))
            .thenAnswer((_) async => Right('Added to Watchlist'));
        when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => true);
        return seriesDetailBloc;
      },
      act: (bloc) => bloc.add(AddToWatchlist(testTvSeriesDetail)),
      expect: () => [
        seriesDetailStateInitial.copyWith(
            watchlistMessage: 'Added to Watchlist'),
        seriesDetailStateInitial.copyWith(
            watchlistMessage: 'Added to Watchlist', isAddedToWatchlist: true),
      ],
      verify: (_) {
        verify(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail));
        verify(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id));
      },
    );

    blocTest<SeriesDetailBloc, SeriesDetailState>(
      'Shoud emit watchlistMessage when Failed',
      build: () {
        when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
        when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => false);
        return seriesDetailBloc;
      },
      act: (bloc) => bloc.add(AddToWatchlist(testTvSeriesDetail)),
      expect: () => [
        seriesDetailStateInitial.copyWith(watchlistMessage: 'Failed'),
      ],
      verify: (_) {
        verify(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail));
        verify(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id));
      },
    );
  });

  group('Remove watchlist Series', () {
    blocTest<SeriesDetailBloc, SeriesDetailState>(
      'Give success message when remove watchlist',
      build: () {
        when(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail))
            .thenAnswer((_) async => Right('Removed From Watchlist'));
        when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => false);
        return seriesDetailBloc;
      },
      act: (bloc) => bloc.add(RemoveFromWatchlist(testTvSeriesDetail)),
      expect: () => [
        seriesDetailStateInitial.copyWith(
            watchlistMessage: 'Removed From Watchlist',
            isAddedToWatchlist: false),
      ],
      verify: (_) {
        verify(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail));
        verify(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id));
      },
    );

    blocTest<SeriesDetailBloc, SeriesDetailState>(
      'Shoud emit watchlistMessage when Failed',
      build: () {
        when(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
        when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => false);
        return seriesDetailBloc;
      },
      act: (bloc) => bloc.add(RemoveFromWatchlist(testTvSeriesDetail)),
      expect: () => [
        seriesDetailStateInitial.copyWith(watchlistMessage: 'Failed'),
      ],
      verify: (_) {
        verify(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail));
        verify(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id));
      },
    );
  });
}
