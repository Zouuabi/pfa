import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final file = File('docs/index.html');
  if (!file.existsSync()) {
    return Response.json(statusCode: HttpStatus.notFound);
  }
  return Response(body: 'sdfds');
}
