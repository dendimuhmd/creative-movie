import 'package:core/core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/top_rated_bloc.dart';
import 'package:provider/provider.dart';

class TopRatedMoviesPage extends StatefulWidget {
  static const routeName = '/top-rated-movie';

  @override
  _TopRatedMoviesPageState createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TopRatedMovieBloc>(context, listen: false)
            .add(const TopRatedEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedMovieBloc, TopRatedState>(
          builder: (context, state) {
            if (state is TopRatedLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return MovieCard(movie);
                },
                itemCount: state.movies.length,
              );
            } else if (state is TopRatedEmpty) {
              return Center(
                child: Text('Empty Top Rated Movie', style: kSubtitle),
              );
            } else if (state is TopRatedError) {
              return Center(
                key: const Key('error_message'),
                child: Text(state.message, style: kSubtitle),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
