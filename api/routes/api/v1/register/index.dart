import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:dartz/dartz.dart';

import '../../../../data/data_source/remote/database_service.dart';
import '../../../../data/models/user.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../data/repositories/user/user_repository_impl.dart';
import '../../../../models/failure_response.dart';
import '../../../../models/register_response.dart';

/// Handles incoming requests.
///
/// This function is called whenever a request is made to the server.
/// It validates the request method and delegates to the appropriate handler.
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

/// Handles POST requests.
///
/// This function is called when a POST request is made to the server.
/// It parses the request body, creates a User object, and attempts to register the user.
FutureOr<Response> _onPost(RequestContext context) async {
  final Map<String, dynamic> body;
  try {
    // Try to parse the request body as JSON.
    body = await context.request.json() as Map<String, dynamic>;
  } catch (_) {
    // If an error occurs (e.g., the request body is not valid JSON),
    // return a 400 Bad Request response.
    return Response.json(statusCode: HttpStatus.badRequest, body: {
      'status': HttpStatus.badRequest,
      'message': 'Make sure the format of the body is correct',
    });
  }

  try {
    // Try to create a User object from the request body.
    User user = User.fromJson(body);

    // Get the UserRepository.
    UserRepository _repo =
        UserRepositoryImpl(dataBaseService: DataBaseService.instance());

    // Try to register the user.
    final Either<Failure, RegisterResponse> result =
        await _repo.register(user: user);

    // Return the result of the registration attempt.
    // If the registration was successful, return a RegisterResponse.
    // If the registration failed, return a Failure.
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
    // If an error occurs (e.g., the User object could not be created),
    // return a 400 Bad Request response.
    return Response.json(statusCode: HttpStatus.badRequest, body: {
      'status': HttpStatus.badRequest,
      'message': 'Data in body is not correct',
    });
  }
}
