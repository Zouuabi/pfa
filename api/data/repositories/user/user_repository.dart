import 'dart:async';

import '../../../models/failure_response.dart';
import '../../../models/login_response.dart';
import '../../../models/register_response.dart';
import 'package:dartz/dartz.dart';

import '../../models/user.dart';

abstract class UserRepository {
  FutureOr<Either<Failure, LoginResponse>> fetchFromCredentials(
      {required String email, required String password});

  FutureOr<Either<Failure, RegisterResponse>> register({required User user});
}
