import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/state_enum.dart';
import '../../../domain/entities/tv_series/series.dart';
import '../../../domain/usecases/tv_series/get_top_rated_series.dart';

part 'top_rated_series_state.dart';

class TopRatedSeriesCubit extends Cubit<TopRatedSeriesState> {
  TopRatedSeriesCubit({required this.getTopRatedTvSeriess})
      : super(TopRatedSeriesInitial());
  final GetTopRatedTvSeriess getTopRatedTvSeriess;

  RequestState _state = RequestState.Empty;
  RequestState get initialState => _state;

  List<TvSeries> _tvSeriess = [];
  List<TvSeries> get tvSeriess => _tvSeriess;

  String _message = '';
  String get message => _message;
}
