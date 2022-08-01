import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/state_enum.dart';
import '../../../domain/entities/tv_series/series.dart';

part 'series_list_state.dart';

class SeriesListCubit extends Cubit<SeriesListState> {
  SeriesListCubit() : super(SeriesListInitial());

  var _nowPlayingTvSeriess = <TvSeries>[];
  List<TvSeries> get nowPlayingTvSeriess => _nowPlayingTvSeriess;

  RequestState _nowPlayingState = RequestState.Empty;
  RequestState get nowPlayingState => _nowPlayingState;

  var _popularTvSeriess = <TvSeries>[];
  List<TvSeries> get popularTvSeriess => _popularTvSeriess;

  RequestState _popularTvSeriessState = RequestState.Empty;
  RequestState get popularTvSeriessState => _popularTvSeriessState;

  var _topRatedTvSeriess = <TvSeries>[];
  List<TvSeries> get topRatedTvSeriess => _topRatedTvSeriess;

  RequestState _topRatedTvSeriessState = RequestState.Empty;
  RequestState get topRatedTvSeriessState => _topRatedTvSeriessState;

  String _message = '';
  String get message => _message;
}
