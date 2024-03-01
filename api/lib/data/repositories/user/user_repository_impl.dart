import 'package:api/data/data_source/remote_data_source/database_service.dart';
import 'package:api/data/models/user.dart';
import 'package:api/data/repositories/user/user_repository.dart';

///
class UserRepositoryImpl implements UserRepository {
  ///
  UserRepositoryImpl({required this.db});

  ///
  final DataBaseService db;
  @override
  Future<void> createUser(User user) async {
    final connection = db.connection;

    await connection.collection('users').insert(
      {'id': 'sdfds', 'name': 'oubeid'},
    );
  }

  @override
  Future<void> deleteUser(String id) async {}

  @override
  Future<User> getUserByCredentials(String username, String password) {
    // TODO: implement getUserByCredentials
    throw UnimplementedError();
  }

  @override
  Future<User> getUserById(String id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }
}
