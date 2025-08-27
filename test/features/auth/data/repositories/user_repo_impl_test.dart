import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mood_music_mobile/features/auth/data/datasources/local_data_source.dart';
import 'package:mood_music_mobile/features/auth/data/datasources/remote_data_source.dart';
import 'package:mood_music_mobile/features/auth/data/model/user_model.dart';
import 'package:mood_music_mobile/features/auth/data/repositories/user_repo_impl.dart';
import 'mock_generator.mocks.dart';
import 'test_data.dart';

void main() {
  late LocalDataSource localData;
  late RemoteDataSource remotedata;
  late UserRepoImpl userRepoImpl;

  setUp(() {
    localData = MockLocalDataSource();
    remotedata = MockRemoteDataSource();
    userRepoImpl = UserRepoImpl(
      localDataSource: localData,
      remoteDataSource: remotedata,
    );
  });

  group("Login Test", () {
    test("Login", () async {
      //arrange
      when(
        remotedata.login(TestData.tUsername, TestData.tPassword),
      ).thenAnswer((_) async => TestData.tUserModel);

      //act
      final result = await userRepoImpl.login(
        TestData.tUsername,
        TestData.tPassword,
      );

      //assert
      expect(result, isA<UserModel>());
      expect(result, TestData.tUserModel);

      //verify
      verify(
        remotedata.login(TestData.tUsername, TestData.tPassword),
      ).called(1);
    });
  });

  group("register/signup test", () {
    test("succesful", () async {
      //arrange
      when(
        remotedata.register(
          TestData.tUsername,
          TestData.tEmail,
          TestData.tPassword,
        ),
      ).thenAnswer((_) async => TestData.tUserModel);

      //act
      final result = await userRepoImpl.register(
        TestData.tUsername,
        TestData.tEmail,
        TestData.tPassword,
      );

      //asssert
      expect(result, isA<UserModel>());
      expect(result, TestData.tUserModel);

      //verify
      verify(
        remotedata.register(
          TestData.tUsername,
          TestData.tEmail,
          TestData.tPassword,
        ),
      ).called(1);
    });
  });
}
