import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/core/config/env_config.dart';
import 'package:riverpod_example/core/network/exceptions.dart';
import 'package:riverpod_example/movie/data/models/movie_result_model.dart';

part 'movie_remote_datasource.g.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResultModel> fetchPlayingMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl(this.dio);

  @override
  Future<MovieResultModel> fetchPlayingMovies() async {
    try {
      final apiKey = EnvConfig.tmdbApiKey;

      final response = await dio.get(
        '/movie/now_playing',
        queryParameters: {'language': 'ko-KR', 'region': 'KR'},
        options: Options(headers: {'Authorization': 'Bearer $apiKey'}),
      );

      return MovieResultModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw APIException(
        message: e.message ?? 'Unknown error',
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 500);
    }
  }
}

@riverpod
Dio dio(Ref ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );
}

@riverpod
MovieRemoteDataSource movieRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return MovieRemoteDataSourceImpl(dio);
}
