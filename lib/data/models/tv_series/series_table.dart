import 'package:equatable/equatable.dart';

import '../../../domain/entities/tv_series/series.dart';
import '../../../domain/entities/tv_series/series_detail.dart';

class TvSeriesTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;

  TvSeriesTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory TvSeriesTable.fromEntity(TvSeriesDetail series) => TvSeriesTable(
        id: series.id!,
        title: series.originalName,
        posterPath: series.posterPath,
        overview: series.overview,
      );

  factory TvSeriesTable.fromMap(Map<String, dynamic> map) => TvSeriesTable(
        id: map['id'],
        title: map['name'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
      };

  TvSeries toEntity() => TvSeries.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        name: title,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, posterPath, overview];
}
