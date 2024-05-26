import 'package:dart_frog/dart_frog.dart';

import '../../../../data/data_source/remote/database_service.dart';
import '../../../../data/repositories/project/project_repository_impl.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  final repo =
      ProjectRepositoryImpl(dataBaseService: DataBaseService.instance());

  final rest = await repo.fetchRelevantProjects();
  return Response.json(body: rest);
}
