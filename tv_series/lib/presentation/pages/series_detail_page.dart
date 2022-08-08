import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:core/domain/entities/tv_series/series_detail.dart';
import 'package:core/domain/entities/tv_series/series_genre.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:tv_series/presentation/bloc/series_detail_bloc.dart';

class TvSeriesDetailPage extends StatefulWidget {
  static const routeName = '/detail-tv-series';

  final int id;
  TvSeriesDetailPage({required this.id});

  @override
  _TvSeriesDetailPageState createState() => _TvSeriesDetailPageState();
}

class _TvSeriesDetailPageState extends State<TvSeriesDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<SeriesDetailBloc>(context, listen: false)
          .add(FetchTvSeriesDetail(widget.id));
      Provider.of<SeriesDetailBloc>(context, listen: false)
          .add(LoadWatchlistStatus(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SeriesDetailBloc, SeriesDetailState>(
        listener: (context, state) async {
          if (state.watchlistMessage ==
                  SeriesDetailBloc.watchlistAddSuccessMessage ||
              state.watchlistMessage ==
                  SeriesDetailBloc.watchlistRemoveSuccessMessage) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.watchlistMessage),
            ));
          } else {
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(state.watchlistMessage),
                  );
                });
          }
        },
        listenWhen: (previousState, currentState) =>
            previousState.watchlistMessage != currentState.watchlistMessage &&
            currentState.watchlistMessage != '',
        builder: (context, state) {
          if (state.tvSeriesDetailState == RequestState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.tvSeriesDetailState == RequestState.Loaded) {
            final tvShow = state.tvSeriesDetail!;
            return SafeArea(
              child: DetailContent(
                tvShow,
                state.tvSeries,
                state.isAddedToWatchlist,
              ),
            );
          } else if (state.tvSeriesDetailState == RequestState.Error) {
            return Center(child: Text(state.message, style: kSubtitle));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final TvSeriesDetail tvSeries;
  final List<TvSeries> recommendations;
  final bool isAddedWatchlist;

  DetailContent(this.tvSeries, this.recommendations, this.isAddedWatchlist);

  @override
  Widget build(BuildContext context) {
    log("Ini isinyaa ${tvSeries.originalName}");
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tvSeries.originalName ?? '',
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (!isAddedWatchlist) {
                                  Provider.of<SeriesDetailBloc>(context,
                                          listen: false)
                                      .add(AddToWatchlist(tvSeries));
                                } else {
                                  Provider.of<SeriesDetailBloc>(context,
                                          listen: false)
                                      .add(RemoveFromWatchlist(tvSeries));
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlist
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: tvSeries.voteAverage ?? 0 / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${tvSeries.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _showGenres(tvSeries.genres!),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              tvSeries.overview ?? '',
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<SeriesDetailBloc, SeriesDetailState>(
                              builder: (context, state) {
                                if (state.tvSeriesState ==
                                    RequestState.Loading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state.tvSeriesState ==
                                    RequestState.Error) {
                                  return Text(state.message);
                                } else if (state.tvSeriesState ==
                                    RequestState.Loaded) {
                                  return Container(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final tvShow = recommendations[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                TvSeriesDetailPage.routeName,
                                                arguments: tvShow.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${tvShow.posterPath}',
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: recommendations.length,
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<SeriesGenre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
