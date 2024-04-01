import 'package:api/src/data/repositories/user/user_repository_impl.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_auth/dart_frog_auth.dart';

Handler middleware(Handler handler) {
  final userRepository = UserRepositoryImpl();
  return handler.use(requestLogger()).use(
    basicAuthentication<String>(
      authenticator: (context, email, password) {
        final userRepository = context.read<UserRepositoryImpl>();
        final token =
            userRepository.generateToken(email: email, password: password);
        return Future.value(token);
      },
    ),
  );
}
