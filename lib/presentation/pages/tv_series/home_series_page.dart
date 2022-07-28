import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';

import 'package:ditonton/presentation/pages/about_page.dart';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/movie/home_movie_page.dart';
import 'package:ditonton/presentation/pages/tv_series/popular_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/search_page.dart';
import 'package:ditonton/presentation/pages/tv_series/series_detail_page.dart';
import 'package:ditonton/presentation/pages/tv_series/top_rated_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/watchlist_series_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/tv_series/series.dart';
import '../../provider/tv_series/series_list_notifier.dart';
import '../movie/search_page.dart';
import '../movie/watchlist_movies_page.dart';

class HomeTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/tv_series';
  @override
  _HomeTvSeriesPageState createState() => _HomeTvSeriesPageState();
}

class _HomeTvSeriesPageState extends State<HomeTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<TvSeriesListNotifier>(context, listen: false)
          ..fetchNowPlayingTvSeriess()
          ..fetchPopularTvSeriess()
          ..fetchTopRatedTvSeriess());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                Navigator.pushNamed(context, HomeMoviePage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Series'),
              onTap: () {
                Navigator.pushNamed(context, HomeTvSeriesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Tv Series'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing',
                style: kHeading6,
              ),
              Consumer<TvSeriesListNotifier>(builder: (context, data, child) {
                final state = data.nowPlayingState;
                if (state == RequestState.Loading) {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return TvSeriesList(
                      data.nowPlayingTvSeriess as List<TvSeries>);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularSeriesPage.ROUTE_NAME),
              ),
              Consumer<TvSeriesListNotifier>(builder: (context, data, child) {
                final state = data.popularTvSeriessState;
                if (state == RequestState.Loading) {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return TvSeriesList(data.popularTvSeriess as List<TvSeries>);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedSeriesPage.ROUTE_NAME),
              ),
              Consumer<TvSeriesListNotifier>(builder: (context, data, child) {
                final state = data.topRatedTvSeriessState;
                if (state == RequestState.Loading) {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return TvSeriesList(data.topRatedTvSeriess as List<TvSeries>);
                } else {
                  return Text('Failed');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvSeriesList extends StatelessWidget {
  final List<TvSeries> tvSeriess;

  TvSeriesList(this.tvSeriess);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tvSeries = tvSeriess[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvSeriesDetailPage.ROUTE_NAME,
                  arguments: tvSeries.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tvSeries.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CupertinoActivityIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeriess.length,
      ),
    );
  }
}
