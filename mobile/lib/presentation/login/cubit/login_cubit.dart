import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

enum Status { intial, loading, success, failed }

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(status: Status.intial));

  void login({required String email, required String password}) {
    emit(const LoginState(status: Status.loading));
    // bch nahki maa l api
    Future.delayed(const Duration(seconds: 2), () {
      if (password == 'Doudy2k23!') {
        emit(const LoginState(status: Status.success));
      } else {
        emit(const LoginState(
            status: Status.failed, data: 'you entered a wrong password'));
      }
    });
  }
}

class LoginState extends Equatable {
  const LoginState({required this.status, this.data});
  final Status status;
  final String? data;

  @override
  List<Object> get props => [status];
}
