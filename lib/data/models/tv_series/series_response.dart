import 'package:ditonton/data/models/movie/movie_model.dart';
import 'package:ditonton/data/models/tv_series/series_model.dart';
import 'package:equatable/equatable.dart';

class TvSeriesResponse extends Equatable {
  final List<TvSeriesModel> tvSerieslist;

  TvSeriesResponse({required this.tvSerieslist});

  factory TvSeriesResponse.fromJson(Map<String, dynamic> json) =>
      TvSeriesResponse(
        tvSerieslist: List<TvSeriesModel>.from((json["results"] as List)
            .map((x) => TvSeriesModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(tvSerieslist.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [tvSerieslist];
}
