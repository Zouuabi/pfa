import 'package:mongo_dart/mongo_dart.dart';

import '../../../config/collection.dart';
import '../../data_source/remote/database_service.dart';
import '../../models/projectz.dart';
import '../../models/user.dart';
import '../faillure_message.dart';
import 'project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepositroy {
  final DataBaseService _dataBaseService = DataBaseService.instance();
  @override
  Future<void> create({required Projectz project}) async {
    Db? _db = _dataBaseService.connection;

    if (_db != null) {
      try {
        final result = await _db
            .collection(Collections.project)
            .insertOne(project.toJson());
        if (result.nInserted == 0) {
          throw Exception(FailureMessage.creationFailed);
        }
      } catch (e) {
        throw Exception(FailureMessage.serverError);
      }
    } else {
      throw Exception(FailureMessage.serverError);
    }
  }

  @override
  Future<void> delete({required String id}) async {
    Db? _db = _dataBaseService.connection;

    if (_db != null) {
      try {
        final result = await _db
            .collection(Collections.project)
            .deleteOne(where.id(ObjectId.fromHexString(id)));

        if (result.nRemoved == 0) {
          print('Document not deleted ');
        } else {
          print('Document deleted successfully');
        }
      } catch (e) {
        print('An error occurred: $e');
      }
    } else {
      throw (Exception());
    }
  }

  @override
  Future<Projectz?> fetchById({required String id}) async {
    Db? _db = _dataBaseService.connection;

    if (_db != null) {
      final result = await _db
          .collection(Collections.project)
          .modernFindOne(selector: where.id(ObjectId.fromHexString(id)));
      if (result != null) {
        return Projectz.fromJson(result);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<List<Projectz>> fetchRelatedProjects() async {
    return [];
  }

  @override
  Future<List<Projectz>> fetchRelevantProjects() async {
    final _db = _dataBaseService.connection;
    if (_db != null) {
      final result = await _db.collection(Collections.project).modernFind();
    }
    return [];
  }

  @override
  Future<void> update({required ObjectId id}) async {}
}
