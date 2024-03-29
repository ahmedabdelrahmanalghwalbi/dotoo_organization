import 'package:dummy_tdd/core/usecase/usecase.dart';
import 'package:dummy_tdd/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/typedef.dart';

class CreateUser extends UsecaseWithParams {
  const CreateUser(this._repository);
  final AuthenticationRepository _repository;

  @override
  ResultFuture call(params) async => _repository.createUser(
      name: 'name', avatar: 'avatar', createdAt: 'createdAt');
}

class CreateUserParams extends Equatable {
  final String name;
  final String avatar;
  final String createdAt;
  const CreateUserParams(
      {required this.name, required this.avatar, required this.createdAt});
  //empty constructor with default values
  const CreateUserParams.empty()
      : this(
            avatar: "empty_avatar",
            name: "empty_name",
            createdAt: "empty_Create_at");

  @override
  List<Object?> get props => [name, avatar, createdAt];
}
