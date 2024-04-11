import 'package:mongo_dart/mongo_dart.dart';

import '../../models/project.dart';
import 'project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepositroy {
  @override
  Future<void> create({required Projectz project}) async {}

  @override
  Future<void> delete({required ObjectId id}) async {}

  @override
  Future<Projectz?> fetchById({required ObjectId id}) async {
    return Projectz();
  }

  @override
  Future<List<Projectz>> fetchRelatedProjects() async {
    return [Projectz()];
  }

  @override
  Future<List<Projectz>> fetchRelevantProjects() async {
    return [];
  }

  @override
  Future<void> update({required ObjectId id}) async {}
}
