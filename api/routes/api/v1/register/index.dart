import 'dart:async';
import 'dart:io';

import 'package:api/src/data/models/user.dart';
import 'package:api/src/data/repositories/user/user_repository.dart';
import 'package:api/src/data/repositories/user/user_repository_impl.dart';
import 'package:api/src/models/failure_response.dart';
import 'package:api/src/models/register_response.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dartz/dartz.dart';

FutureOr<Response> onRequest(RequestContext context) {
  final request = context.request;

  switch (request.method.value) {
    case 'POST':
      return _onPost(context);
    default:
      return Response.json(
        statusCode: HttpStatus.methodNotAllowed,
        body: {
          'status': HttpStatus.methodNotAllowed,
          'code': 'method-not-allowed',
          'message': 'Only Post method is allowed',
        },
      );
  }
}

/// this is like doPost in servlet (like a controller in our case)
FutureOr<Response> _onPost(RequestContext context) async {
  final body;
  try {
    body = await context.request.json();
  } catch (_) {
    /// this exeption occurs when [jsont()] fails to convert the body to json
    /// which means that the request body is mal formatted
    ///
    return Response.json(statusCode: HttpStatus.badRequest, body: {
      'status': HttpStatus.badRequest,
      'message': 'make sure the format of the body is correct',
    });
  }

  try {
    ///
    User user = User.fromJson(body);

    ///
    UserRepository _repo = UserRepositoryImpl();

    ///
    ///
    final Either<Failure, RegisterResponse> result =
        await _repo.register(user: user);

    /// here we are returning the result of the fold
    /// being either a failure or a register response
    ///
    ///
    return result.fold(
      (failure) {
        return Response.json(
            statusCode: failure.status, body: failure.toJson());
      },
      (registerResponse) {
        return Response.json(
            statusCode: registerResponse.status,
            body: registerResponse.toJson());
      },
    );
  } catch (_) {
    /// if the creation of the user fails
    /// an exception will be thrown and wil be catched here
    ///
    return Response.json(statusCode: HttpStatus.badRequest, body: {
      'status': HttpStatus.badRequest,
      'message': 'Data in body is not correct',
    });
  }
}
