import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:dartz/dartz.dart';

import '../../../../models/failure_response.dart';
import '../../../../models/login_response.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.post => _onPost(context),
    _ => Future.value(
        Response(statusCode: HttpStatus.methodNotAllowed),
      ),
  };
}

FutureOr<Response> _onPost(RequestContext context) async {
  final Map<String, dynamic> body;

  try {
    body = await context.request.json() as Map<String, dynamic>;
  } catch (_) {
    return Response(statusCode: HttpStatus.badRequest);
  }

  return Response.json(
      body: context
          .read<Either<Failure, LoginResponse>>()
          .fold((l) => l.toJson(), (r) => r.toJson()));
}
