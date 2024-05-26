import 'package:dart_frog/dart_frog.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart' as shelf;

import '../data/data_source/remote/database_service.dart';

import '../data/repositories/project/project_repository_impl.dart';
import '../data/repositories/user/user_repository_impl.dart';

final DataBaseService _db = DataBaseService.instance();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<UserRepositoryImpl>(
          (context) => UserRepositoryImpl(dataBaseService: _db)))
      .use(provider<ProjectRepositoryImpl>(
          (context) => ProjectRepositoryImpl(dataBaseService: _db)))
      .use(
    fromShelfMiddleware(
      shelf.corsHeaders(
        originChecker: (origin) {
          return shelf.originAllowAll(origin);
        },
      ),
    ),
  );
}
