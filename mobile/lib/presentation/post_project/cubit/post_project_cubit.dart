import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/models/failure.dart';
import 'package:mobile/data/models/user.dart';
import 'package:mobile/data/repositories/project_repository/repositoryImp.dart';

enum Status { initial, loading, success, failed }

class PostProjectCubit extends Cubit<PostProjectState> {
  PostProjectCubit() : super(const PostProjectState(status: Status.initial));

  void postProject({
    required String title,
    required String introduction,
    required String description,
    required List<String> keywords,
    required Map<String, dynamic> user,
  }) async {
    emit(const PostProjectState(status: Status.loading));
    Either<void, Failure> result = await RepositoryImp().postProject(
      title: title,
      introduction: introduction,
      description: description,
      keywords: keywords,
      user: user,
    );
    result.fold(
        (_) => emit(const PostProjectState(status: Status.success)),
        (failure) => emit(PostProjectState(
            status: Status.failed, data: failure.errorMessage)));
  }
}

class PostProjectState extends Equatable {
  const PostProjectState({required this.status, this.data});
  final Status status;
  final dynamic data;

  @override
  List<Object> get props => [status];
}
