import '../../models/tv_series/series_detail_model.dart';
import '../../models/tv_series/series_model.dart';

abstract class TvSeriesRemoteDataSource {
  Future<List<TvSeriesModel>> getNowPlayingTvSeriess();
  Future<List<TvSeriesModel>> getPopularTvSeriess();
  Future<List<TvSeriesModel>> getTopRatedTvSeriess();
  Future<TvSeriesDetailResponse> getTvSeriesDetail(int id);
  Future<List<TvSeriesModel>> getTvSeriesRecommendations(int id);
  Future<List<TvSeriesModel>> searchTvSeriess(String query);
}
