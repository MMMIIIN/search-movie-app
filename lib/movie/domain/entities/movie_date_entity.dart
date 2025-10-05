class MovieDateEntity {
  final DateTime maximum;
  final DateTime minimum;

  const MovieDateEntity({required this.maximum, required this.minimum});

  factory MovieDateEntity.empty() {
    return MovieDateEntity(maximum: DateTime.now(), minimum: DateTime.now());
  }
}
