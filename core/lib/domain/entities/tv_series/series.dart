import 'package:equatable/equatable.dart';

class TvSeries extends Equatable {
  TvSeries(
      {required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.voteAverage,
      required this.voteCount,
      // required this.name,
      required this.originalName});

  TvSeries.watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.originalName,
  });
  String? backdropPath;
  DateTime? firstAirDate;
  List<int>? genreIds;
  int? id;
  String? name;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  double? voteAverage;
  int? voteCount;

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
        originalName
      ];
}
