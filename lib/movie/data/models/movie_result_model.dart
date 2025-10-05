import 'package:riverpod_example/movie/data/models/movie_date_model.dart';
import 'package:riverpod_example/movie/data/models/movie_model.dart';
import 'package:riverpod_example/movie/domain/entities/movie_result_entity.dart';

class MovieResultModel extends MovieResultEntity {
  const MovieResultModel({
    required super.dates,
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory MovieResultModel.fromJson(Map<String, dynamic> json) {
    return MovieResultModel(
      dates: MovieDateModel.fromJson(json['dates'] as Map<String, dynamic>),
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dates': (dates as MovieDateModel).toJson(),
      'page': page,
      'results': results.map((e) => (e as MovieModel).toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
