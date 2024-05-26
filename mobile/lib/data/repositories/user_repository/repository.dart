import 'package:dartz/dartz.dart';
import 'package:mobile/data/models/failure.dart';
import 'package:mobile/data/models/user.dart';

abstract class Repository {
  Future<Either<User, Failure>> login(
      {required String email, required String password});
  Future<Either<void, Failure>> register({required Map<String, dynamic> user});
}
