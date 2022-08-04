part of 'series_list_bloc.dart';

abstract class SeriesListState extends Equatable {
  const SeriesListState();

  @override
  List<Object> get props => [];
}

class SeriesListEmpty extends SeriesListState {}

class SeriesListLoading extends SeriesListState {}

class SeriesListLoaded extends SeriesListState {
  final List<TvSeries> tvSeries;

  SeriesListLoaded(this.tvSeries);

  @override
  List<Object> get props => [tvSeries];
}

class SeriesListError extends SeriesListState {
  final String message;

  SeriesListError(this.message);

  @override
  List<Object> get props => [message];
}
