import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_auth/dart_frog_auth.dart';
import 'package:dartz/dartz.dart';
import '../../../../data/repositories/user/user_repository_impl.dart';
import '../../../../models/failure_response.dart';
import '../../../../models/login_response.dart';

Handler middleware(Handler handler) {
  return handler.use(
    basicAuthentication<Either<Failure, LoginResponse>>(
      authenticator: (context, email, password) async {
        final userRepository = UserRepositoryImpl();
        final result = await userRepository.fetchFromCredentials(
            email: email, password: password);

        return result;
      },
    ),
  );
}
