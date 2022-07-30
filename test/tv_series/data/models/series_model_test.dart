import 'package:ditonton/data/models/tv_series/series_model.dart';

import 'package:ditonton/domain/entities/tv_series/series.dart';
import 'package:flutter_test/flutter_test.dart';

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

  final tTvSeries = TvSeries(
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
  // final tTvSeries = TvSeries(
  //     originalName: "originalName",
  //     posterPath: "posterPath",
  //     id: 1,
  //     overview: "overview",
  //     popularity: 1.0,
  //     genreIds: [1, 1],
  //     backdropPath: "backdropPath",
  //     voteAverage: 1.0,
  //     voteCount: 1);

  test('should be a subclass of TvSeries entity', () async {
    final result = tTvSeriesModel.toEntity();
    expect(result, tTvSeries);
  });
}
