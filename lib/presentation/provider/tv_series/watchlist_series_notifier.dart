import 'package:flutter/foundation.dart';

import '../../../common/state_enum.dart';
import '../../../domain/entities/tv_series/series.dart';
import '../../../domain/usecases/tv_series/get_watchlist_series.dart';

class WatchlistTvSeriesNotifier extends ChangeNotifier {
  var _watchlistTvSeriess = <TvSeries>[];
  List<TvSeries> get watchlistTvSeriess => _watchlistTvSeriess;

  var _watchlistState = RequestState.Empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  WatchlistTvSeriesNotifier({required this.getWatchlistTvSeriess});

  final GetWatchlistTvSeries getWatchlistTvSeriess;

  Future<void> fetchWatchlistTvSeriess() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTvSeriess.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriessData) {
        _watchlistState = RequestState.Loaded;
        _watchlistTvSeriess = tvSeriessData;
        notifyListeners();
      },
    );
  }
}
