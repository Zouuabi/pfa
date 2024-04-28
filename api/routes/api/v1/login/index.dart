import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:dartz/dartz.dart';

import '../../../../data/repositories/user/user_repository_impl.dart';
import '../../../../models/failure_response.dart';
import '../../../../models/login_response.dart';

Future<Response> onRequest(RequestContext context) async {
  // Check the HTTP method of the request
  switch (context.request.method) {
    case HttpMethod.post:
      // If it's a POST request, handle it with the _onPost function
      return _onPost(context);
    default:
      // For any other HTTP method, return a 405 Method Not Allowed response
      return Future.value(
        Response(statusCode: HttpStatus.methodNotAllowed),
      );
  }
}

/// Handles POST requests.
///
/// This function is called when a POST request is made to the server.
/// It parses the request body and attempts to log in the user.
FutureOr<Response> _onPost(RequestContext context) async {
  final Map<String, dynamic> body;

  try {
    // Try to parse the request body as JSON
    body = await context.request.json() as Map<String, dynamic>;
  } catch (_) {
    // If an error occurs (e.g., the request body is not valid JSON),
    // return a 400 Bad Request response
    return Response(statusCode: HttpStatus.badRequest);
  }

  if (body['email'] == null || body['password'] == null) {
    return Response(statusCode: HttpStatus.badRequest);
  }
  final repo = context.read<UserRepositoryImpl>();

  // return Response.json(body: {
  //   "email": body["email"],
  //   "password": body["password"],
  // });
  // Attempt to log in the user and get the response
  final Either<Failure, LoginResponse> loginResult = await repo
      .fetchFromCredentials(email: body['email'], password: body['password']);

  // Convert the login result to JSON and return it in the response
  return Response.json(
    body: loginResult.fold(
      (failure) =>
          failure.toJson(), // If the login failed, return the failure details
      (loginResponse) => loginResponse
          .toJson(), // If the login succeeded, return the login response
    ),
  );
}
