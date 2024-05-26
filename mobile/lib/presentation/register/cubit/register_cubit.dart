import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/models/failure.dart';
import 'package:mobile/data/repositories/user_repository/repositoryImp.dart';

enum Status { intial, loading, success, failed }

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState(status: Status.intial));

  void register({required Map<String, dynamic> user}) async {
    emit(const RegisterState(status: Status.loading));
    Either<void, Failure> result = await RepositoryImp().register(user: user);
    result.fold(
        (_) => emit(const RegisterState(status: Status.success)),
        (failure) => emit(
            RegisterState(status: Status.failed, data: failure.errorMessage)));
  }
}

class RegisterState extends Equatable {
  const RegisterState({required this.status, this.data});
  final Status status;
  final dynamic data;

  @override
  List<Object> get props => [status];
}
