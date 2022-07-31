import 'package:flutter/foundation.dart';

import '../../../common/state_enum.dart';
import '../../../domain/entities/tv_series/series.dart';
import '../../../domain/usecases/tv_series/get_popular_series.dart';

class PopularTvSeriessNotifier extends ChangeNotifier {
  final GetPopularTvSeriess getPopularTvSeriess;

  PopularTvSeriessNotifier(this.getPopularTvSeriess);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvSeries> _tvSeriess = [];
  List<TvSeries> get tvSeriess => _tvSeriess;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularTvSeriess() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTvSeriess.execute();

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
