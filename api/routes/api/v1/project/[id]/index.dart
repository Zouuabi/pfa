import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../../../../data/repositories/project/project_repository.dart';

FutureOr<Response> onRequest(RequestContext context, String id) async {
  switch (context.request.method) {
    case HttpMethod.delete:
      return _onDelete(context, id);
    case HttpMethod.get:
      return _onGet(context, id);
    default:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

FutureOr<Response> _onDelete(RequestContext context, String id) async {
  final _repo = context.read<ProjectRepositroy>();
  try {
    _repo.delete(id: id);
    return Response(statusCode: HttpStatus.movedPermanently);
  } catch (_) {
    return Response(statusCode: HttpStatus.internalServerError);
  }
}

FutureOr<Response> _onGet(RequestContext context, String id) async {
  final _repo = context.read<ProjectRepositroy>();
  try {
    final result = await _repo.fetchById(id: id);
    if (result == null) {
      return Response.json(statusCode: HttpStatus.notFound);
    }
    return Response.json(statusCode: HttpStatus.ok, body: result);
  } catch (_) {
    return Response(
        statusCode: HttpStatus.internalServerError, body: _.toString());
  }
}
