import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../../../data/models/projectz.dart';
import '../../../../data/repositories/project/project_repository.dart';

// {
//   "owner": {

//       "role": "role",
//       "username": "username",
//       "gender": "gender",
//       "birthDay": "birthDay",
//       "phoneNumber": "phoneNumber",
//       "interests": [],
//       "email": "email",
//       "password": "password"

// 	},
//       "title": "title",
//       "intro": "intro",
//       "description": "description",
//       "keywords": [],
//       "createdAt": "createdAt"

// }

/// Handles incoming requests to [api/v1/project].
///
FutureOr<Response> onRequest(RequestContext context) async {
  /// Check if the request method is POST.
  /// If not, return a 405 Method Not Allowed response.
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  /// Initialize a Projectz object.
  final Projectz project;

  try {
    /// Try to parse the request body as JSON and create a Projectz object.
    final body = await context.request.json() as Map<String, dynamic>;
    project = Projectz.fromJson(body);
  } catch (e) {
    /// If an error occurs (e.g., the request body is not valid JSON or does not match the Projectz structure),
    /// return a 400 Bad Request response with the error message.
    return Response(statusCode: HttpStatus.badRequest, body: e.toString());
  }

  /// Get the ProjectRepository from the context.
  final _repo = context.read<ProjectRepositroy>();

  try {
    /// Try to create the project in the database.
    _repo.create(project: project);

    /// If the project is successfully created, return a 201 Created response.
    return Response(statusCode: HttpStatus.created);
  } catch (e) {
    /// If an error occurs (e.g., the database is not reachable),
    /// return a 500 Internal Server Error response.
    return Response(statusCode: HttpStatus.internalServerError);
  }
}
