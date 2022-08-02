import 'package:flutter/foundation.dart';
import 'package:core/core.dart';

import '../../../domain/entities/tv_series/series.dart';
import '../../../domain/usecases/tv_series/search_series.dart';

class TvSeriesSearchNotifier extends ChangeNotifier {
  final SearchTvSeriess searchTvSeriess;

  TvSeriesSearchNotifier({required this.searchTvSeriess});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvSeries> _searchResult = [];
  List<TvSeries> get searchResult => _searchResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchTvSeriesSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchTvSeriess.execute(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _searchResult = data;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
