import 'dart:io';
import 'dart:convert';
import 'package:api/src/data/repositories/user_repository/user_repository.dart';
import 'package:api/src/data/repositories/user_repository/user_repository_impl.dart';
import 'package:api/src/models/login_response.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  UserRepository _repo = UserRepositoryImpl();

  final body = context.request.body();
  final myMap;

  try {
    myMap = jsonEncode(body) as Map<String, dynamic>;
  } catch (e) {
    return Response.json(statusCode: HttpStatus.badRequest);
  }

  final String? email = myMap['email'];
  final String? password = myMap['password'];

  if (email == null || password == null) {
    return Response.json(statusCode: HttpStatus.badRequest);
  }

  final LoginResponse response =
      await _repo.login(email: email, password: password);

  return Response.json(statusCode: HttpStatus.ok, body: response.tojson());
}
