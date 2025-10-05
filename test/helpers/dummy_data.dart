import 'package:riverpod_example/movie/domain/entities/movie_date_entity.dart';
import 'package:riverpod_example/movie/domain/entities/movie_entity.dart';
import 'package:riverpod_example/movie/domain/entities/movie_result_entity.dart';

const testMovieEntity = MovieEntity(
  adult: false,
  backdropPath: '/backdrop.jpg',
  genreIds: [28, 12],
  originalLanguage: 'en',
  originalTitle: 'Test Movie',
  overview: 'Test overview',
  popularity: 100.0,
  posterPath: '/poster.jpg',
  releaseDate: '2024-01-01',
  title: 'Test Movie',
  video: false,
  voteAverage: 8.5,
  voteCount: 1000,
);

final testMovieDateEntity = MovieDateEntity(
  maximum: DateTime(2024, 12, 31),
  minimum: DateTime(2024, 1, 1),
);

final testMovieResultEntity = MovieResultEntity(
  dates: testMovieDateEntity,
  page: 1,
  results: [testMovieEntity],
  totalPages: 10,
  totalResults: 100,
);

const testMovieJson = {
  'adult': false,
  'backdrop_path': '/backdrop.jpg',
  'genre_ids': [28, 12],
  'original_language': 'en',
  'original_title': 'Test Movie',
  'overview': 'Test overview',
  'popularity': 100.0,
  'poster_path': '/poster.jpg',
  'release_date': '2024-01-01',
  'title': 'Test Movie',
  'video': false,
  'vote_average': 8.5,
  'vote_count': 1000,
};

const testMovieResultJson = {
  'dates': {
    'maximum': '2024-12-31T00:00:00.000',
    'minimum': '2024-01-01T00:00:00.000',
  },
  'page': 1,
  'results': [testMovieJson],
  'total_pages': 10,
  'total_results': 100,
};
