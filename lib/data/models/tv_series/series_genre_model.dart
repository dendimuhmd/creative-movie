import 'package:ditonton/domain/entities/movie/genre.dart';
import 'package:ditonton/domain/entities/tv_series/series_genre.dart';
import 'package:equatable/equatable.dart';

class TvSeriesGenreModel extends Equatable {
  TvSeriesGenreModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory TvSeriesGenreModel.fromJson(Map<String, dynamic> json) =>
      TvSeriesGenreModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  SeriesGenre toEntity() {
    return SeriesGenre(id: this.id, name: this.name);
  }

  @override
  List<Object?> get props => [id, name];
}
