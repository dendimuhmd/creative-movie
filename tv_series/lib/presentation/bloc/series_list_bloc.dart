import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/usecases/get_now_playing_series.dart';
import 'package:tv_series/domain/usecases/get_popular_series.dart';
import 'package:tv_series/domain/usecases/get_top_rated_series.dart';

part 'series_list_event.dart';
part 'series_list_state.dart';

class SeriesListBloc extends Bloc<SeriesListEvent, SeriesListState> {
  final GetNowPlayingTvSeriess getNowPlayingTvSeriess;
  SeriesListBloc(this.getNowPlayingTvSeriess) : super(SeriesListEmpty()) {
    on<SeriesListEvent>((event, emit) async {
      // TODO: implement event handler
      emit(SeriesListLoading());
      final result = await getNowPlayingTvSeriess.execute();
      result.fold(
        (failure) => emit(SeriesListError(failure.message)),
        (seriesData) => emit(SeriesListLoaded(seriesData)),
      );
    });
  }
}

class PopularSeriesListBloc extends Bloc<SeriesListEvent, SeriesListState> {
  final GetPopularTvSeriess getPopularSeriess;
  PopularSeriesListBloc(this.getPopularSeriess) : super(SeriesListEmpty()) {
    on<SeriesListEvent>((event, emit) async {
      emit(SeriesListLoading());
      final result = await getPopularSeriess.execute();
      result.fold(
        (failure) => emit(SeriesListError(failure.message)),
        (seriesData) => emit(SeriesListLoaded(seriesData)),
      );
    });
  }
}

class TopRatedSeriesListBloc extends Bloc<SeriesListEvent, SeriesListState> {
  final GetTopRatedTvSeriess getTopRatedSeriess;
  TopRatedSeriesListBloc(this.getTopRatedSeriess) : super(SeriesListEmpty()) {
    on<SeriesListEvent>((event, emit) async {
      emit(SeriesListLoading());
      final result = await getTopRatedSeriess.execute();
      result.fold(
        (failure) => emit(SeriesListError(failure.message)),
        (seriesData) => emit(SeriesListLoaded(seriesData)),
      );
    });
  }
}
