import 'dart:developer';

import 'package:equatable/equatable.dart';

import '../../../domain/entities/tv_series/series_detail.dart';
import 'series_genre_model.dart';

class TvSeriesDetailResponse extends Equatable {
  TvSeriesDetailResponse({
    required this.originalName,
    // required this.originCountry,
    // required this.numberOfSeasons,
    // required this.languages,
    // required this.episodeRunTime,
    // required this.type,
    // required this.lastAirDate,
    // required this.numberOfEpisodes,
    // required this.inProduction,
    required this.adult,
    required this.backdropPath,
    // required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.originalLanguage,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.status,
    required this.tagline,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;

  // List<int> episodeRunTime;
  // DateTime firstAirDate;
  List<TvSeriesGenreModel> genres;
  String homepage;
  int id;
  // bool inProduction;
  // List<String>? languages;
  // DateTime lastAirDate;

  // int numberOfEpisodes;
  // int numberOfSeasons;
  // List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;

  String status;
  String tagline;
  // String type;
  double voteAverage;
  int voteCount;

  factory TvSeriesDetailResponse.fromJson(Map<String, dynamic> json) {
    log("Masuk sini ${json['original_name']}");
    return TvSeriesDetailResponse(
      adult: json["adult"],
      // firstAirDate: DateTime.parse(json['first_air_date']),
      originalName: json['original_name'],
      // type: json['type'],
      // numberOfSeasons: json['number_of_seasons'],
      // numberOfEpisodes: json['number_of_episodes'],
      // lastAirDate: DateTime.parse(json['last_air_date']),
      // inProduction: json['in_production'],
      // originCountry: json['origin_country'],
      // episodeRunTime: json['episode_run_time'],
      backdropPath: json["backdrop_path"] ?? '',
      genres: List<TvSeriesGenreModel>.from(
          json["genres"].map((x) => TvSeriesGenreModel.fromJson(x))),
      homepage: json["homepage"],
      id: json["id"],
      originalLanguage: json["original_language"],
      overview: json["overview"],
      popularity: json["popularity"].toDouble(),
      posterPath: json["poster_path"],
      status: json["status"],
      tagline: json["tagline"],
      voteAverage: json["vote_average"].toDouble(),
      voteCount: json["vote_count"],
    );
  }

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "original_language": originalLanguage,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "status": status,
        "tagline": tagline,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  TvSeriesDetail toEntity() {
    return TvSeriesDetail(
      originalName: this.originalName,
      adult: this.adult,
      backdropPath: this.backdropPath,
      genres: this.genres.map((genre) => genre.toEntity()).toList(),
      id: this.id,
      overview: this.overview,
      posterPath: this.posterPath,
      voteAverage: this.voteAverage,
      voteCount: this.voteCount,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        homepage,
        id,
        originalLanguage,
        overview,
        popularity,
        posterPath,
        status,
        tagline,
        voteAverage,
        voteCount,
      ];
}
