import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/models/failure.dart';
import 'package:mobile/data/models/user.dart';
import 'package:mobile/data/repositories/user_repository/repositoryImp.dart';

enum Status { intial, loading, success, failed }

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(status: Status.intial));

  void login({required String email, required String password}) async {
    emit(const LoginState(status: Status.loading));
    Either<User, Failure> result =
        await RepositoryImp().login(email: email, password: password);
    result.fold(
        (user) => emit(LoginState(status: Status.success, data: user)),
        (failure) => emit(
            LoginState(status: Status.failed, data: failure.errorMessage)));
  }
}

class LoginState extends Equatable {
  const LoginState({required this.status, this.data});
  final Status status;
  final dynamic data;

  @override
  List<Object> get props => [status];
}
