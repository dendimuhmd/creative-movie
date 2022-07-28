import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/tv_series/series.dart';

class TvSeriesModel extends Equatable {
  TvSeriesModel(
      {required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.voteAverage,
      required this.voteCount,
      required this.firstAirDate,
      required this.name,
      required this.originCountry,
      required this.originalLanguage,
      required this.originalName});

  String backdropPath;
  DateTime firstAirDate;
  List<int> genreIds;
  int id;
  String name;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  double voteAverage;
  int voteCount;

  factory TvSeriesModel.fromJson(Map<String, dynamic> json) {
    print('result${json['original_name']}');
    return TvSeriesModel(
      backdropPath: json["backdrop_path"] ?? '',
      genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      id: json["id"],
      overview: json["overview"],
      popularity: json["popularity"].toDouble(),
      posterPath: json["poster_path"],
      voteAverage: json["vote_average"].toDouble(),
      voteCount: json["vote_count"],
      firstAirDate: DateTime.parse(json['first_air_date']),
      name: json['name'],
      originalLanguage: json['original_language'],
      originalName: json['original_title'] ?? json['original_name'],
      originCountry: List<String>.from(json['origin_country'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  TvSeries toEntity() {
    return TvSeries(
      backdropPath: this.backdropPath,
      genreIds: this.genreIds,
      id: this.id,
      overview: this.overview,
      popularity: this.popularity,
      posterPath: this.posterPath,
      voteAverage: this.voteAverage,
      voteCount: this.voteCount,
    );
  }

  @override
  List<Object?> get props => [
        backdropPath,
        genreIds,
        id,
        overview,
        popularity,
        posterPath,
        voteAverage,
        voteCount,
      ];
}
