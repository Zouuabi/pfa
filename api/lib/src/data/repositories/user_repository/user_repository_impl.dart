import 'package:api/src/data/data_source/remote/database_service.dart';
import 'package:api/src/data/repositories/user_repository/user_repository.dart';
import 'package:api/src/data/models/user.dart';
import 'package:api/src/models/login_response.dart';
import 'package:mongo_dart/mongo_dart.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  final DataBaseService dataBaseService = DataBaseService.instance();

  @override
  Future<LoginResponse> login(
      {required String email, required String password}) async {
    final Db? connection = dataBaseService.connection;

    if (connection != null) {
      try {
        final Map<String, dynamic>? result =
            await connection.collection('user').findOne({'email': email});

        if (result == null) {
          return LoginResponse(message: 'wrong email', token: null);
        } else {
          User user = User.fromJson(result);
          if (user.password == password) {
            return LoginResponse(message: 'logged in', token: '0000');
          } else {
            return LoginResponse(message: 'wrong password', token: null);
          }
        }
      } catch (e) {
        return LoginResponse(message: 'internal error', token: null);
      }
    } else {
      return LoginResponse(message: 'internal error', token: null);
    }
  }

  @override
  void register({required User user}) {}
}
