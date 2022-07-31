import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/tv_series/series_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_series/series_remote_data_source.dart';
import 'package:ditonton/domain/repositories/series_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  TvSeriesRepository,
  TvSeriesRemoteDataSource,
  TvSeriesLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
