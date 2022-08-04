import 'package:core/core.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:core/domain/entities/tv_series/series.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchlistPage extends StatefulWidget {
  static const routeName = '/watchlist-page';

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> with RouteAware {
  final List<String> _tabTitle = ['Movies', 'Tv Series'];
  final List<Widget> _bodyPage = [_WatchlistMovies(), _WatchlistTvShows()];

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<WatchlistMovieBloc>(context, listen: false)
            .add(WatchlistEvent()));
    Future.microtask(() =>
        Provider.of<WatchlistSeriesBloc>(context, listen: false)
            .add(WatchlistEvent()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    Provider.of<WatchlistMovieBloc>(context, listen: false)
        .add(const WatchlistEvent());
    Provider.of<WatchlistSeriesBloc>(context, listen: false)
        .add(const WatchlistEvent());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Watchlist'),
          bottom: TabBar(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50), // Creates border
                color: Colors.lightGreen[600]),
            tabs: [
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.movie),
                    const SizedBox(width: 8),
                    Text(_tabTitle[0], style: kSubtitle),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.tv),
                    const SizedBox(width: 8),
                    Text(_tabTitle[1], style: kSubtitle),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: _bodyPage),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}

class _WatchlistMovies extends StatelessWidget {
  const _WatchlistMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<WatchlistMovieBloc, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WatchlistHasData<Movie>) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = state.WatchlistResult[index];
                return MovieCard(movie);
              },
              itemCount: state.WatchlistResult.length,
            );
          } else if (state is WatchlistEmpty) {
            return Center(
              child: Text(state.message, style: kSubtitle),
            );
          } else if (state is WatchlistError) {
            return Center(
              child: Text(state.message, style: kSubtitle),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class _WatchlistTvShows extends StatelessWidget {
  const _WatchlistTvShows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<WatchlistSeriesBloc, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WatchlistHasData<TvSeries>) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final tvSeries = state.WatchlistResult[index];
                return TvSeriesCard(tvSeries);
              },
              itemCount: state.WatchlistResult.length,
            );
          } else if (state is WatchlistEmpty) {
            return Center(
              child: Text(state.message, style: kSubtitle),
            );
          } else if (state is WatchlistError) {
            return Center(
              child: Text(state.message, style: kSubtitle),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
