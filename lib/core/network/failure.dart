import 'package:equatable/equatable.dart';
import 'package:riverpod_example/core/network/exceptions.dart';

abstract class Failure extends Equatable {
  final String message;
  final int statusCode;

  const Failure({required this.message, required this.statusCode});
}

class APIFailure extends Failure {
  const APIFailure({required super.message, required super.statusCode});

  APIFailure.fromException(APIException exception)
    : this(message: exception.message, statusCode: exception.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure(String message)
    : super(message: message, statusCode: 500);

  @override
  List<Object?> get props => [message, statusCode];
}
