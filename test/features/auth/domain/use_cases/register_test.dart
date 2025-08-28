import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mood_music_mobile/features/auth/data/datasources/local_data_source.dart';
import 'package:mood_music_mobile/features/auth/data/datasources/remote_data_source.dart';
import 'package:mood_music_mobile/features/auth/domain/repositories/user_repo.dart';
import 'package:mood_music_mobile/features/auth/domain/use_cases/register.dart';

import 'mock_genrator.mocks.dart';
import 'test_data.dart';


void main(){
  late UserRepo repo;
  late LocalDataSource localdata;
  late RemoteDataSource remotedata;
  late Register register;
  late MockEntityModelConv conv;

  setUp((){
    localdata = MockLocalDataSource();
    remotedata = MockRemoteDataSource();
    conv = MockEntityModelConv();
    repo = MockUserRepo(remotedata, localdata);
    register = Register(repo, conv);
  });

  test("should call repo.register and convert to entity", () async {
    // arrange
  when(repo.register(TestData.tUsername, TestData.tEmail, TestData.tPassword))
    .thenAnswer((_) async => TestData.tUserModel);


// conv.toEntity returns UserEntity
    when(conv.toEntity(TestData.tUserModel))
        .thenReturn(TestData.tUserEntity);

    // act
    final result = await register(RegisterParams(
      username: TestData.tUsername,
      email: TestData.tEmail,
      password: TestData.tPassword,
    ));

    // assert
    expect(result, equals(TestData.tUserEntity));

    //verify
    verify(repo.register("johndoe", "johndoe@example.com", "password123")).called(1);
    verify(conv.toEntity(TestData.tUserModel)).called(1);
  });
}