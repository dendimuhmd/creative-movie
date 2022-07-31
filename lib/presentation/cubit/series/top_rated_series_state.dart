part of 'top_rated_series_cubit.dart';

abstract class TopRatedSeriesState extends Equatable {
  const TopRatedSeriesState();

  @override
  List<Object> get props => [];
}

class TopRatedSeriesInitial extends TopRatedSeriesState {}

class TopRatedSeriesLoading extends TopRatedSeriesState {}

class TopRatedSeriesLoaded extends TopRatedSeriesState {}

class TopRatedSeriesError extends TopRatedSeriesState {}
