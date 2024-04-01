import 'package:api/src/models/login_response.dart';

import '../../models/user.dart';

abstract class UserRepository {
  Future<LoginResponse> login(
      {required String email, required String password});
  void register({required User user});
}
