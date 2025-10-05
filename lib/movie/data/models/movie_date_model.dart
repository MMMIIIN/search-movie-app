import 'package:riverpod_example/movie/domain/entities/movie_date_entity.dart';

class MovieDateModel extends MovieDateEntity {
  const MovieDateModel({
    required super.maximum,
    required super.minimum,
  });

  factory MovieDateModel.fromJson(Map<String, dynamic> json) {
    return MovieDateModel(
      maximum: DateTime.parse(json['maximum'] as String),
      minimum: DateTime.parse(json['minimum'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maximum': maximum.toIso8601String(),
      'minimum': minimum.toIso8601String(),
    };
  }
}
