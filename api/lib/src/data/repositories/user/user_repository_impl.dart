import 'dart:async';
import 'dart:io';

import 'package:api/src/data/data_source/remote/database_service.dart';
import 'package:api/src/data/repositories/user/user_repository.dart';
import 'package:api/src/data/models/user.dart';
import 'package:api/src/models/failure_response.dart';
import 'package:api/src/models/login_response.dart';
import 'package:api/src/models/register_response.dart';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  final DataBaseService dataBaseService = DataBaseService.instance();

  @override
  Future<LoginResponse> login(
      {required String email, required String password}) async {
    final Db? connection = dataBaseService.connection;

    if (connection != null) {
      try {
        final Map<String, dynamic>? result =
            await connection.collection('user').findOne({'email': email});

        if (result == null) {
          return LoginResponse(message: 'wrong email', token: null);
        } else {
          User user = User.fromJson(result);
          if (user.password == password) {
            return LoginResponse(message: 'logged in', token: '0000');
          } else {
            return LoginResponse(message: 'wrong password', token: null);
          }
        }
      } catch (e) {
        return LoginResponse(message: 'internal error', token: null);
      }
    } else {
      return LoginResponse(message: 'internal error', token: null);
    }
  }

  @override
  FutureOr<Either<Failure, RegisterResponse>> register(
      {required User user}) async {
    final Db? cnn = dataBaseService.connection;

    if (cnn != null) {
      await cnn.collection('user').insert(user.toJson());

      return Right(
          RegisterResponse(status: HttpStatus.created, data: user.toJson()));
    } else {
      return Left(Failure(
          status: HttpStatus.internalServerError,
          code: 'server-error',
          message: 'Something went wrong on our side'));
    }
  }
}

// 1)  Objet =>Register succes
// class RegisterResponse{
// status : 200 ,
// data : {
// 'userName'
// }
// }
// 2) Object => failure
// Failure {
  // status : sdfds
  // errorMessage : weeksdfsd email not valid
// }
