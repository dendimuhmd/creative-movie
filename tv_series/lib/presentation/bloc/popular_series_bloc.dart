import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/usecases/get_popular_series.dart';

part 'popular_series_event.dart';
part 'popular_series_state.dart';

class PopularSeriesBloc extends Bloc<PopularSeriesEvent, PopularTvSeriesState> {
  final GetPopularTvSeriess getPopularTvSeriess;
  PopularSeriesBloc(this.getPopularTvSeriess) : super(PopularTvSeriesEmpty()) {
    on<PopularSeriesEvent>((event, emit) async {
      emit(PopularTvSeriesLoading());
      final result = await getPopularTvSeriess.execute();
      result.fold(
        (failure) => emit(PopularTvSeriesError(failure.message)),
        (tvShowsData) {
          emit(PopularTvSeriesLoaded(tvShowsData));
          if (tvShowsData.isEmpty) {
            emit(PopularTvSeriesEmpty());
          }
        },
      );
    });
  }
}
