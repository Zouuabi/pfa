import 'dart:async';
import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dartz/dartz.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../../config/collection.dart';
import '../../../models/failure_response.dart';
import '../../../models/login_response.dart';
import '../../../models/register_response.dart';
import '../../data_source/remote/database_service.dart';
import '../../models/user.dart';
import '../faillure_message.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.dataBaseService});

  final DataBaseService dataBaseService;
  String generateToken({required User user}) {
    final jwt = JWT(
      {
        'id': user.id,
        'role': user.role,
        'email': user.email,
      },
    );
    return jwt.sign(SecretKey('Doudy2k23!'), expiresIn: Duration(days: 7));
  }

  String verifyToken({required String token}) {
    try {
      final jwt = JWT.verify(
        token,
        SecretKey('Doudy2k23!'),
      );
      return 'valid';
    } on JWTException catch (e) {
      // invalid signature
      // invalid signature
      if (e.message == 'jwt expired') {
        return FailureMessage.sessionExpired;
      } else {
        return FailureMessage.invalidToken;
      }
    }

    // Check token expiration
    // if (DateTime.now().isAfter(jwt.)) {
    //   print('Token has expired');
    //   return 'expired';
    // }

    // Token is valid and not expired
    //   return true;
    // } on JWTExpiredError {
    //   print('Token has expired');
    //   return false;
    // } on JWTError catch (e) {
    //   print('Failed to verify token: ${e.message}');
    //   return false;
    // } catch (e) {
    //   print('An unexpected error occurred: $e');
    //   return false;
    // }
  }

  @override
  FutureOr<Either<Failure, LoginResponse>> fetchFromCredentials(
      {required String email, required String password}) async {
    try {
      final Db connection = await dataBaseService.connection;
      final Map<String, dynamic>? result;
      try {
        result = await connection
            .collection(Collections.user)
            .findOne({'email': email});
      } on MongoDartError catch (e) {
        return Left(Failure(
            status: HttpStatus.internalServerError, message: e.message));
      }

      if (result == null) {
        return Left(Failure(
            status: HttpStatus.notFound, message: FailureMessage.userNotFound));
      } else {
        User user = User.fromJson(result);
        ObjectId userId = result['_id'] as ObjectId;

        user.id = userId.oid;
        if (user.password == password) {
          String _token = generateToken(user: user);
          return Right(LoginResponse(
              id: user.id,
              username: user.username,
              phoneNumber: user.birthDay,
              gender: user.birthDay,
              birthDay: user.birthDay,
              interests: user.interests,
              email: email,
              token: _token,
              role: user.role));
        } else {
          return Left(Failure(
              status: HttpStatus.notAcceptable,
              message: FailureMessage.wrongPassword));
        }
      }
    } catch (e) {
      return Left(Failure(
          status: HttpStatus.internalServerError,
          message: "server error occured"));
    }
  }

  @override
  FutureOr<Either<Failure, RegisterResponse>> register(
      {required User user}) async {
    try {
      final Db cnn = await dataBaseService.connection;

      await cnn.collection(Collections.user).insert(user.toJson());

      return Right(
          RegisterResponse(status: HttpStatus.created, data: user.toJson()));
    } catch (e) {
      return Left(Failure(
        status: HttpStatus.internalServerError,
        message: FailureMessage.serverError,
      ));
    }
  }
}
