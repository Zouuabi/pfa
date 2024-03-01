import 'package:api/data/models/models.dart';

///
abstract class UserRepository {
  ///
  Future<void> createUser(User user);

  ///
  Future<User> getUserById(String id);

  ///
  Future<User> getUserByCredentials(String username, String password);

  ///
  Future<void> deleteUser(String id);
}
