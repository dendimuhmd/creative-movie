part of 'series_detail_bloc.dart';

abstract class SeriesDetailEvent extends Equatable {
  const SeriesDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchTvSeriesDetail extends SeriesDetailEvent {
  final int id;

  FetchTvSeriesDetail(this.id);

  @override
  List<Object> get props => [id];
}

class AddToWatchlist extends SeriesDetailEvent {
  final TvSeriesDetail tvSeriesDetail;

  AddToWatchlist(this.tvSeriesDetail);

  @override
  List<Object> get props => [tvSeriesDetail];
}

class RemoveFromWatchlist extends SeriesDetailEvent {
  final TvSeriesDetail tvSeriesDetail;

  RemoveFromWatchlist(this.tvSeriesDetail);

  @override
  List<Object> get props => [tvSeriesDetail];
}

class LoadWatchlistStatus extends SeriesDetailEvent {
  final int id;

  LoadWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}
