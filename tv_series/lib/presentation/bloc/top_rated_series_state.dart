part of 'top_rated_series_bloc.dart';

abstract class TopRatedSeriesState extends Equatable {
  const TopRatedSeriesState();

  @override
  List<Object> get props => [];
}

class TopRatedSeriesEmpty extends TopRatedSeriesState {}

class TopRatedSeriesLoading extends TopRatedSeriesState {}

class TopRatedSeriesLoaded extends TopRatedSeriesState {
  final List<TvSeries> tvSeries;

  TopRatedSeriesLoaded(this.tvSeries);

  @override
  List<Object> get props => [tvSeries];
}

class TopRatedSeriesError extends TopRatedSeriesState {
  final String message;

  TopRatedSeriesError(this.message);

  @override
  List<Object> get props => [message];
}
