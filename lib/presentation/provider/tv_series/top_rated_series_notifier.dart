import 'package:ditonton/common/state_enum.dart';

import 'package:flutter/foundation.dart';

import '../../../domain/entities/tv_series/series.dart';
import '../../../domain/usecases/tv_series/get_top_rated_series.dart';

class TopRatedTvSeriessNotifier extends ChangeNotifier {
  final GetTopRatedTvSeriess getTopRatedTvSeriess;

  TopRatedTvSeriessNotifier({required this.getTopRatedTvSeriess});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvSeries> _tvSeriess = [];
  List<TvSeries> get tvSeriess => _tvSeriess;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedTvSeriess() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTvSeriess.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvSeriessData) {
        _tvSeriess = tvSeriessData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
