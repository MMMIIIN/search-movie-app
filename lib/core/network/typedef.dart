import 'package:dartz/dartz.dart';
import 'package:riverpod_example/core/network/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;
