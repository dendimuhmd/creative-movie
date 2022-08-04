import 'package:about/about.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:movie/presentation/bloc/movie_list_bloc.dart';
import 'package:movie/presentation/pages/home_movie_page.dart';
import 'package:provider/provider.dart';
import 'package:search/presentation/pages/search_pages.dart';
import 'package:tv_series/presentation/bloc/series_list_bloc.dart';
import 'package:tv_series/presentation/pages/home_series_page.dart';
import 'package:watchlist/presentation/pages/watchlist_page.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final List<String> _tabTitle = ['Movies', 'Tv Shows'];
  final List<Widget> _page = [HomeMoviePage(), HomeTvSeriesPage()];
  void _onSelectedPage(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NowPlayingMovieListBloc>(context, listen: false)
          .add(MovieListEvent());
      Provider.of<PopularMovieListBloc>(context, listen: false)
          .add(MovieListEvent());
      Provider.of<TopRatedMovieListBloc>(context, listen: false)
          .add(MovieListEvent());
    });
    Future.microtask(() {
      Provider.of<SeriesListBloc>(context, listen: false)
          .add(SeriesListEvent());
      Provider.of<PopularSeriesListBloc>(context, listen: false)
          .add(SeriesListEvent());
      Provider.of<TopRatedSeriesListBloc>(context, listen: false)
          .add(SeriesListEvent());
    });
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
              accountName:
                  Text('Ditonton', style: kHeading6.copyWith(fontSize: 17)),
              accountEmail: Text('ditonton@dicoding.com', style: kSubtitle),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text(_tabTitle[0], style: kSubtitle),
              onTap: () {
                _onSelectedPage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.tv),
              title: Text(_tabTitle[1], style: kSubtitle),
              onTap: () {
                _onSelectedPage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist', style: kSubtitle),
              onTap: () {
                Navigator.pushNamed(context, WatchlistPage.routeName);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About', style: kSubtitle),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('${_tabTitle[_index]}'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.routeName);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: _page[_index],
    );
  }
}