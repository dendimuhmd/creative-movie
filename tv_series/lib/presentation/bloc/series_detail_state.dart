part of 'series_detail_bloc.dart';

class SeriesDetailState extends Equatable {
  final TvSeriesDetail? tvSeriesDetail;
  final List<TvSeries> tvSeries;
  final RequestState tvSeriesDetailState;
  final RequestState tvSeriesState;
  final String message;
  final String watchlistMessage;
  final bool isAddedToWatchlist;

  SeriesDetailState({
    required this.tvSeriesDetail,
    required this.tvSeries,
    required this.tvSeriesDetailState,
    required this.tvSeriesState,
    required this.message,
    required this.watchlistMessage,
    required this.isAddedToWatchlist,
  });

  SeriesDetailState copyWith({
    TvSeriesDetail? tvSeriesDetail,
    List<TvSeries>? tvSeries,
    RequestState? tvSeriesDetailState,
    RequestState? tvSeriesState,
    String? message,
    String? watchlistMessage,
    bool? isAddedToWatchlist,
  }) {
    return SeriesDetailState(
      tvSeriesDetail: tvSeriesDetail ?? this.tvSeriesDetail,
      tvSeries: tvSeries ?? this.tvSeries,
      tvSeriesDetailState: tvSeriesDetailState ?? this.tvSeriesDetailState,
      tvSeriesState: tvSeriesState ?? this.tvSeriesState,
      message: message ?? this.message,
      watchlistMessage: watchlistMessage ?? this.watchlistMessage,
      isAddedToWatchlist: isAddedToWatchlist ?? this.isAddedToWatchlist,
    );
  }

  factory SeriesDetailState.initial() {
    return SeriesDetailState(
      tvSeriesDetail: null,
      tvSeries: [],
      tvSeriesDetailState: RequestState.Empty,
      tvSeriesState: RequestState.Empty,
      message: '',
      watchlistMessage: '',
      isAddedToWatchlist: false,
    );
  }

  @override
  List<Object?> get props => [
        tvSeriesDetail,
        tvSeries,
        tvSeriesDetailState,
        tvSeriesState,
        message,
        watchlistMessage,
        isAddedToWatchlist,
      ];
}
