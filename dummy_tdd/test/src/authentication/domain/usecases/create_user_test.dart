import 'package:dartz/dartz.dart';
import 'package:dummy_tdd/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:dummy_tdd/src/authentication/domain/usecases/create_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late CreateUser usecase;
  const CreateUserParams params = CreateUserParams.empty();
  late AuthenticationRepository repository;
  setUpAll(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });
  test("should call the [AuthRepo.createUser]", () async {
    //Arrange
    when(() => repository.createUser(
            name: any(named: 'name'),
            avatar: any(named: 'avatar'),
            createdAt: any(named: 'createdAt')))
        .thenAnswer((_) async => const Right(null));

    //Act
    final result = await usecase(params);
    expect(result, equals(const Right<dynamic, void>(null)));
    verify(() => repository.createUser(
        name: params.name,
        avatar: params.avatar,
        createdAt: params.createdAt)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
