import 'package:api/src/data/data_source/remote/database_service.dart';
import 'package:api/src/data/repositories/user/user_repository.dart';
import 'package:api/src/data/models/user.dart';
import 'package:api/src/models/login_response.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:mongo_dart/mongo_dart.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  final DataBaseService dataBaseService = DataBaseService.instance();
  String? generateToken({email, password}) {
    final jwt = JWT(
      {
        'email': email,
        'password': password,
      },
    );

    return jwt.sign(SecretKey('123'));
  }

  User? verifyToken(String token) {
    try {
      final payload = JWT.verify(
        token,
        SecretKey('123'),
      );

      final payloadData = payload.payload as Map<String, dynamic>;

      final email = payloadData['email'] as String;
      return User(
          username: 'username',
          email: 'email',
          phoneNumber: 'phoneNumber',
          password: 'password');
    } catch (e) {
      return null;
    }
  }

  User? findByEmailAndPassword(
      {required String email, required String password}) {
    return User(
        username: 'username',
        email: 'email',
        phoneNumber: 'phoneNumber',
        password: 'password');
  }

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
