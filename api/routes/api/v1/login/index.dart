import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

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
    body = await context.request.json();
  } catch (_) {
    return Response(statusCode: HttpStatus.badRequest);
  }

  final email = body['email'] as String?;
  final password = body['password'] as String?;

  if (email == null || password == null) {
    return Response(statusCode: HttpStatus.badRequest);
  }

  return Response.json(body: {
    'token': 'hgc',
  });
}

//   final body = await context.request.body();
//   final encodedBody = toJson(requestBody: body);

//   if (encodedBody == null) {
//     return Response.json(
//         statusCode: HttpStatus.badRequest,
//         body: {'message': 'Data must be in correct format (Json)'});
//   }
//   final String? email = encodedBody['email'];
//   final String? password = encodedBody['password'];

//   if (email == null || password == null) {
//     return Response.json(statusCode: HttpStatus.badRequest);
//   }

//   final LoginResponse response =
//       await _repo.login(email: email, password: password);

//   return Response.json(statusCode: HttpStatus.ok, body: response.tojson());
// }
