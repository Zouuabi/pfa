import 'dart:async';

import 'package:api/src/models/failure_response.dart';
import 'package:api/src/models/login_response.dart';
import 'package:api/src/models/register_response.dart';
import 'package:dartz/dartz.dart';

import '../../models/user.dart';

abstract class UserRepository {
  Future<LoginResponse> login(
      {required String email, required String password});

  FutureOr<Either<Failure, RegisterResponse>> register({required User user});
}
