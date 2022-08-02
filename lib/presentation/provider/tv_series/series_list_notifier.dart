import 'package:flutter/material.dart';

import 'package:core/core.dart';

import '../../../domain/entities/tv_series/series.dart';
import '../../../domain/usecases/tv_series/get_now_playing_series.dart';
import '../../../domain/usecases/tv_series/get_popular_series.dart';
import '../../../domain/usecases/tv_series/get_top_rated_series.dart';

class TvSeriesListNotifier extends ChangeNotifier {
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

  TvSeriesListNotifier({
    required this.getNowPlayingTvSeriess,
    required this.getPopularTvSeriess,
    required this.getTopRatedTvSeriess,
  });

  final GetNowPlayingTvSeriess getNowPlayingTvSeriess;
  final GetPopularTvSeriess getPopularTvSeriess;
  final GetTopRatedTvSeriess getTopRatedTvSeriess;

  Future<void> fetchNowPlayingTvSeriess() async {
    _nowPlayingState = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingTvSeriess.execute();
    result.fold(
      (failure) {
        _nowPlayingState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriessData) {
        _nowPlayingState = RequestState.Loaded;
        _nowPlayingTvSeriess = tvSeriessData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularTvSeriess() async {
    _popularTvSeriessState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTvSeriess.execute();
    result.fold(
      (failure) {
        _popularTvSeriessState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriessData) {
        _popularTvSeriessState = RequestState.Loaded;
        _popularTvSeriess = tvSeriessData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedTvSeriess() async {
    _topRatedTvSeriessState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTvSeriess.execute();
    result.fold(
      (failure) {
        _topRatedTvSeriessState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriessData) {
        _topRatedTvSeriessState = RequestState.Loaded;
        _topRatedTvSeriess = tvSeriessData;
        notifyListeners();
      },
    );
  }
}
