import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:core/domain/entities/tv_series/series_detail.dart';
import 'package:core/domain/entities/tv_series/series_genre.dart';

final testTvSeries = TvSeries(
    originalName: "2 Good 2 Be True",
    posterPath: "/2Wf5ySCPcnp8lRhbSD7jt0YLz5A.jpg",
    id: 135647,
    overview:
        "After the mysterious disappearance of his father, Joventino, the cowboy José Leôncio becomes a wealthy farm owner in Pantanal. Over twenty years have passed and, bitter-hearted because of his father vanishing and the escape of his wife to Rio de Janeiro with his baby, José Leôncio has the chance to make amends with the boy, now a young man raised in the big city with very different values and habits than his own.",
    popularity: 943.32,
    genreIds: [35, 18],
    backdropPath: "/sIRK4NYe1OK2hOJAg4xxuxzceKk.jpg",
    voteAverage: 7.5,
    voteCount: 102);

final testTvSeriesList = [testTvSeries];

final testTvSeriesDetail = TvSeriesDetail(
    genres: [SeriesGenre(id: 1, name: 'Drama')],
    originalName: "originalName",
    adult: false,
    backdropPath: "backdropPath",
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1);

final testWatchlistTvSeries = TvSeries.watchlist(
  id: 1,
  originalName: 'original_name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvSeriesTable = TvSeriesTable(
  id: 1,
  originalName: 'original_name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvSeriesMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'original_name': 'original_name',
};
