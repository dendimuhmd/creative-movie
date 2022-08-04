import 'package:equatable/equatable.dart';

import 'series_genre.dart';

class TvSeriesDetail extends Equatable {
  TvSeriesDetail(
      {required this.adult,
      required this.backdropPath,
      required this.genres,
      required this.id,
      required this.overview,
      required this.posterPath,
      required this.voteAverage,
      required this.voteCount,
      required this.originalName});

  bool? adult;
  String? backdropPath;

  List<int>? episodeRunTime;
  DateTime? firstAirDate;
  List<SeriesGenre>? genres;
  String? homepage;
  int? id;
  bool? inProduction;
  List<String>? languages;
  DateTime? lastAirDate;

  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;

  String? status;
  String? tagline;
  String? type;
  double? voteAverage;
  int? voteCount;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        id,
        overview,
        posterPath,
        voteAverage,
        voteCount,
      ];
}
