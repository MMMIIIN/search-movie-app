import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/core/network/exceptions.dart';
import 'package:riverpod_example/core/network/failure.dart';
import 'package:riverpod_example/core/network/typedef.dart';
import 'package:riverpod_example/movie/data/datasources/movie_remote_datasource.dart';
import 'package:riverpod_example/movie/data/models/movie_result_model.dart';
import 'package:riverpod_example/movie/data/models/search_movie_model.dart';
import 'package:riverpod_example/movie/domain/repository/movie_repository.dart';

part 'movie_repository_impl.g.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  ResultFuture<MovieResultModel> fetchMovie() async {
    try {
      final result = await remoteDataSource.fetchPlayingMovies();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(APIFailure(message: e.toString(), statusCode: 500));
    }
  }

  @override
  ResultFuture<SearchMovieModel> searchMovie(String query) async {
    try {
      final result = await remoteDataSource.searchMovie(query);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(APIFailure(message: e.toString(), statusCode: 500));
    }
  }
}

@riverpod
MovieRepository movieRepository(Ref ref) {
  final remoteDataSource = ref.watch(movieRemoteDataSourceProvider);
  return MovieRepositoryImpl(remoteDataSource);
}
