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
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  final DataBaseService dataBaseService = DataBaseService.instance();
  String generateToken({required User user}) {
    final jwt = JWT(
      {
        'id': user.id,
        'role': 'individual',
        'email': 'user@example.com',
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
    final Db? connection = dataBaseService.connection;

    if (connection != null) {
      final Map<String, dynamic>? result;
      try {
        result = await connection
            .collection(Collection.user)
            .findOne({'email': email});
      } catch (_) {
        return Left(Failure(
            status: HttpStatus.internalServerError,
            message: FailureMessage.serverError));
      }

      if (result == null) {
        return Left(Failure(
            status: HttpStatus.notFound, message: FailureMessage.userNotFound));
      } else {
        User user = User.fromJson(result);
        if (user.password == password) {
          String _token = generateToken(user: user);
          return Right(LoginResponse(
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
    } else {
      return Left(Failure(
          status: HttpStatus.internalServerError,
          message: FailureMessage.serverError));
    }
  }

  @override
  FutureOr<Either<Failure, RegisterResponse>> register(
      {required User user}) async {
    final Db? cnn = dataBaseService.connection;

    if (cnn != null) {
      await cnn.collection(Collection.user).insert(user.toJson());

      return Right(
          RegisterResponse(status: HttpStatus.created, data: user.toJson()));
    } else {
      return Left(Failure(
        status: HttpStatus.internalServerError,
        message: FailureMessage.serverError,
      ));
    }
  }
}

class FailureMessage {
  static const String serverError = 'server-error';
  static const String userNotFound = 'no-user-found';
  static const String wrongPassword = 'wrong-password';
  static const String sessionExpired = 'session-expired';
  static const String invalidToken = 'invalid-token';
}
