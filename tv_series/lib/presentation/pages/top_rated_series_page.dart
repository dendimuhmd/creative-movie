import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series/presentation/bloc/top_rated_series_bloc.dart';

class TopRatedSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-tvSeries';

  @override
  _TopRatedSeriesPageState createState() => _TopRatedSeriesPageState();
}

class _TopRatedSeriesPageState extends State<TopRatedSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TopRatedSeriesBloc>(context, listen: false)
            .add(const TopRatedSeriesEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedSeriesBloc, TopRatedSeriesState>(
          builder: (context, state) {
            if (state is TopRatedSeriesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedSeriesLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvSeries = state.tvSeries[index];
                  return TvSeriesCard(tvSeries);
                },
                itemCount: state.tvSeries.length,
              );
            } else if (state is TopRatedSeriesEmpty) {
              return Center(
                child: Text('Empty Top Rated Series', style: kSubtitle),
              );
            } else if (state is TopRatedSeriesError) {
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
