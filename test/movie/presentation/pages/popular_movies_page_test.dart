import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/presentation/bloc/popular_movie_bloc.dart';

import 'package:movie/presentation/pages/popular_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../core/dummy_data/movie/dummy_objects.dart';

class PopularMoviesEventFake extends Fake implements PopularMovieEvent {}

class PopularMoviesStateFake extends Fake implements PopularMoviesState {}

class MockPopularMoviesBloc
    extends MockBloc<PopularMovieEvent, PopularMoviesState>
    implements PopularMoviesBloc {}

void main() {
  late MockPopularMoviesBloc mockPopularMoviesBloc;

  setUpAll(() {
    registerFallbackValue(PopularMoviesEventFake());
    registerFallbackValue(PopularMoviesStateFake());
  });

  setUp(() {
    mockPopularMoviesBloc = MockPopularMoviesBloc();
  });

  Widget _widgetBody(Widget body) {
    return BlocProvider<PopularMoviesBloc>.value(
      value: mockPopularMoviesBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockPopularMoviesBloc.state).thenReturn(PopularMoviesLoading());

    final showLoadingWidget = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_widgetBody(PopularMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(showLoadingWidget, findsOneWidget);
  });

  testWidgets('Show ListView when state is load', (WidgetTester tester) async {
    when(() => mockPopularMoviesBloc.state)
        .thenReturn(PopularMoviesLoaded([testMovie]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_widgetBody(PopularMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Show text with message when state is Empty',
      (WidgetTester tester) async {
    when(() => mockPopularMoviesBloc.state).thenReturn(PopularMoviesEmpty());

    final textFinder = find.text('Empty Popular Movie');

    await tester.pumpWidget(_widgetBody(PopularMoviesPage()));

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Show text with message when  state is Error',
      (WidgetTester tester) async {
    when(() => mockPopularMoviesBloc.state)
        .thenReturn(PopularMoviesError('Failed'));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_widgetBody(PopularMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
