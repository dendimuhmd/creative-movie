import 'dart:convert';

import 'package:ditonton/data/models/tv_series/series_model.dart';
import 'package:ditonton/data/models/tv_series/series_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json_reader.dart';

void main() {
  final tTvSeriesModel = TvSeriesModel(
      originalName: "2 Good 2 Be True",
      posterPath: "/2Wf5ySCPcnp8lRhbSD7jt0YLz5A.jpg",
      id: 135647,
      overview:
          "Car mechanic Eloy makes a terrible first impression on Ali, who works for a real estate magnate. But both of them are hiding their true personas.",
      popularity: 943.32,
      genreIds: [35, 18],
      backdropPath: "/sIRK4NYe1OK2hOJAg4xxuxzceKk.jpg",
      voteAverage: 7.5,
      voteCount: 102);

  final tTvSeriesResponseModel =
      TvSeriesResponse(tvSerieslist: <TvSeriesModel>[tTvSeriesModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('tv_series/dummy_data_series/now_playing.json'));
      // act
      final result = TvSeriesResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvSeriesResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvSeriesResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": '/sIRK4NYe1OK2hOJAg4xxuxzceKk.jpg',
            'genre_ids': [35, 18],
            'id': 135647,
            // "original_name": "Original Title",
            "overview":
                "Car mechanic Eloy makes a terrible first impression on Ali, who works for a real estate magnate. But both of them are hiding their true personas.",
            "popularity": 943.32,
            "poster_path": "/2Wf5ySCPcnp8lRhbSD7jt0YLz5A.jpg",
            // "title": "Title",
            // "video": false,
            "vote_average": 7.5,
            "vote_count": 102
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
