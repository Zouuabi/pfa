import 'package:dart_frog/dart_frog.dart';

import '../data/repositories/project/project_repository.dart';
import '../data/repositories/project/project_repository_impl.dart';

Middleware projectProvider() {
  return (handler) {
    return handler
        .use(provider<ProjectRepositroy>((_) => ProjectRepositoryImpl()));
  };
}
