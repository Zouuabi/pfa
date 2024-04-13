import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

import '../../models/projectz.dart';

abstract class ProjectRepositroy {
  Future<void> create({required Projectz project});

  Future<Projectz?> fetchById({required ObjectId id});
  Future<void> update({required ObjectId id});
  Future<void> delete({required ObjectId id});
  Future<List<Projectz>> fetchRelatedProjects();
  Future<List<Projectz>> fetchRelevantProjects();
}
