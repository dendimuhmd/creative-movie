import 'dart:convert';

import '../../../common/exception.dart';
import '../../models/tv_series/series_detail_model.dart';
import '../../models/tv_series/series_model.dart';
import '../../models/tv_series/series_response.dart';
import 'package:http/http.dart' as http;

abstract class TvSeriesRemoteDataSource {
  Future<List<TvSeriesModel>> getNowPlayingTvSeriess();
  Future<List<TvSeriesModel>> getPopularTvSeriess();
  Future<List<TvSeriesModel>> getTopRatedTvSeriess();
  Future<TvSeriesDetailResponse> getTvSeriesDetail(int id);
  Future<List<TvSeriesModel>> getTvSeriesRecommendations(int id);
  Future<List<TvSeriesModel>> searchTvSeriess(String query);
}

class TvSeriesRemoteDataSourceImpl implements TvSeriesRemoteDataSource {
  static const API_KEY = 'api_key=b0667c4054e7d1f4b4ca0c708d2aac8f';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvSeriesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvSeriesModel>> getNowPlayingTvSeriess() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/now_playing?$API_KEY'));

    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvSeriesDetailResponse> getTvSeriesDetail(int id) async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return TvSeriesDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getTvSeriesRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/movie/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getPopularTvSeriess() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getTopRatedTvSeriess() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> searchTvSeriess(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }
}
