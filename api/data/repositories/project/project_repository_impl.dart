import 'package:mongo_dart/mongo_dart.dart';

import '../../data_source/remote/database_service.dart';
import '../../models/projectz.dart';
import '../../models/user.dart';
import 'project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepositroy {
  final DataBaseService _dataBaseService = DataBaseService.instance();
  @override
  Future<void> create({required Projectz project}) async {
    Db? _db = _dataBaseService.connection;

    if (_db != null) {
      try {
        final result = await _db.collection('project').insert(project.toJson());
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Future<void> delete({required ObjectId id}) async {}

  @override
  Future<Projectz?> fetchById({required ObjectId id}) async {
    return Projectz(
        owner: User(
            username: 'username',
            phoneNumber: 'phoneNumber',
            gender: 'gender',
            birthDay: 'birthDay',
            interests: [],
            email: 'email',
            password: 'password',
            role: 'role'),
        title: 'title',
        intro: 'intro',
        createdAt: DateTime.now().toUtc(),
        likes: 0,
        popularity: 0);
  }

  @override
  Future<List<Projectz>> fetchRelatedProjects() async {
    return [];
  }

  @override
  Future<List<Projectz>> fetchRelevantProjects() async {
    return [];
  }

  @override
  Future<void> update({required ObjectId id}) async {}
}
