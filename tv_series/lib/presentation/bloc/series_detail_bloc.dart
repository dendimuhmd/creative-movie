import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:core/domain/entities/tv_series/series_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/usecases/get_series_detail.dart';
import 'package:tv_series/domain/usecases/get_series_recommendations.dart';
import 'package:watchlist/domain/usecases/tv_series/get_watchlist_status_series.dart';
import 'package:watchlist/domain/usecases/tv_series/remove_watchlist_series.dart';
import 'package:watchlist/domain/usecases/tv_series/save_watchlist_series.dart';

part 'series_detail_state.dart';
part 'series_detail_event.dart';

class SeriesDetailBloc extends Bloc<SeriesDetailEvent, SeriesDetailState> {
  final GetTvSeriesDetail getTvSeriesDetail;
  final GetTvSeriesRecommendations getTvSeriesRecommendations;
  final GetWatchListStatusTvSeries getWatchListStatusTvSeries;
  final SaveWatchlistTvSeries saveWatchlistTvSeries;
  final RemoveWatchlistTvSeries removeWatchlistTvSeries;
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';
  SeriesDetailBloc(
      this.getTvSeriesDetail,
      this.getTvSeriesRecommendations,
      this.getWatchListStatusTvSeries,
      this.removeWatchlistTvSeries,
      this.saveWatchlistTvSeries)
      : super(SeriesDetailState.initial()) {
    on<FetchTvSeriesDetail>((event, emit) async {
      emit(state.copyWith(tvSeriesDetailState: RequestState.Loading));
      final detailResult = await getTvSeriesDetail.execute(event.id);
      final tvSeriesRecommendationResult =
          await getTvSeriesRecommendations.execute(event.id);

      detailResult.fold(
        (failure) async {
          emit(state.copyWith(
              tvSeriesDetailState: RequestState.Error,
              message: failure.message));
        },
        (tvShow) async {
          emit(state.copyWith(
            tvSeriesState: RequestState.Loading,
            tvSeriesDetail: tvShow,
            tvSeriesDetailState: RequestState.Loaded,
            message: '',
          ));
          tvSeriesRecommendationResult.fold(
            (failure) {
              emit(state.copyWith(
                  tvSeriesState: RequestState.Error, message: failure.message));
            },
            (tvSeries) {
              emit(state.copyWith(
                tvSeriesState: RequestState.Loaded,
                tvSeries: tvSeries,
                message: '',
              ));
            },
          );
        },
      );
    });
    on<AddToWatchlist>((event, emit) async {
      final result = await saveWatchlistTvSeries.execute(event.tvSeriesDetail);

      result.fold((failure) {
        emit(state.copyWith(watchlistMessage: failure.message));
      }, (successMessage) {
        emit(state.copyWith(watchlistMessage: successMessage));
      });

      add(LoadWatchlistStatus(event.tvSeriesDetail.id!));
    });
    on<RemoveFromWatchlist>((event, emit) async {
      final result =
          await removeWatchlistTvSeries.execute(event.tvSeriesDetail);

      result.fold((failure) {
        emit(state.copyWith(watchlistMessage: failure.message));
      }, (successMessage) {
        emit(state.copyWith(watchlistMessage: successMessage));
      });

      add(LoadWatchlistStatus(event.tvSeriesDetail.id!));
    });
    on<LoadWatchlistStatus>((event, emit) async {
      final result = await getWatchListStatusTvSeries.execute(event.id);
      emit(state.copyWith(isAddedToWatchlist: result));
    });
  }
}
