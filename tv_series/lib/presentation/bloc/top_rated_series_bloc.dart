import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/usecases/get_top_rated_series.dart';

part 'top_rated_series_event.dart';
part 'top_rated_series_state.dart';

class TopRatedSeriesBloc
    extends Bloc<TopRatedSeriesEvent, TopRatedSeriesState> {
  final GetTopRatedTvSeriess getTopRatedTvSeriess;
  TopRatedSeriesBloc(this.getTopRatedTvSeriess) : super(TopRatedSeriesEmpty()) {
    on<TopRatedSeriesEvent>((event, emit) async {
      // TODO: implement event handler
      emit(TopRatedSeriesLoading());
      final result = await getTopRatedTvSeriess.execute();
      result.fold(
        (failure) => emit(TopRatedSeriesError(failure.message)),
        (tvShowsData) {
          emit(TopRatedSeriesLoaded(tvShowsData));
          if (tvShowsData.isEmpty) {
            emit(TopRatedSeriesEmpty());
          }
        },
      );
    });
  }
}
