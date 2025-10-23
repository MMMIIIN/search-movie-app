import 'package:riverpod_example/movie/data/models/movie_model.dart';
import 'package:riverpod_example/movie/domain/entities/search_movie_entity.dart';

class SearchMovieModel extends SearchMovieEntity {
  const SearchMovieModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) {
    return SearchMovieModel(
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
      'page': page,
      'results': results.map((e) => (e as MovieModel).toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
