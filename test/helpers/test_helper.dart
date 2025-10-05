import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_example/movie/data/datasources/movie_remote_datasource.dart';
import 'package:riverpod_example/movie/domain/repository/movie_repository.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  Dio,
])
void main() {}
