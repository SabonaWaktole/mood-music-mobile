import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:mood_music_mobile/features/auth/data/datasources/remote_data_source.dart';
import 'package:mood_music_mobile/features/auth/data/model/user_model.dart';

import 'mock_generator.mocks.dart';
import 'test_data.dart';

void main() {
  late RemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;
  late MockLocalDataSource localDataSource;

  setUp(() {
    mockHttpClient = MockClient();
    localDataSource = MockLocalDataSource();
    dataSource = RemoteDataSourceImpl(
      client: mockHttpClient,
      localDataSource: localDataSource,
    );
  });

  group("Login test", () {
    test("test Login without cache should return usermodel", () async {
      // Arrange: no cached user and successful http response
      when(localDataSource.getCachedUser()).thenAnswer((_) async => null);

      when(
        mockHttpClient.post(
          any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(TestData.response, 200));

      // Act: perform login
      final result = await dataSource.login(
        TestData.tUsername,
        TestData.tPassword,
      );

      // Assert: returned model is correct
      expect(result, isA<UserModel>());
      expect(result, TestData.tUserModel);

      // Verify:
      verify(localDataSource.cacheUser(TestData.tUserModel)).called(1);
    });

    test("test login with cache should return user model", () async {
      // arrange: cached user exists
      when(
        localDataSource.getCachedUser(),
      ).thenAnswer((_) async => TestData.tUserModel);

      // act
      final result = await dataSource.login(
        TestData.tUsername,
        TestData.tPassword,
      );

      // assert
      expect(result, isA<UserModel>());
      expect(result, TestData.tUserModel);

      // verify: no network call and no re-caching
      verify(localDataSource.getCachedUser()).called(1);
      verifyNever(
        mockHttpClient.post(
          any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      );
      verifyNever(localDataSource.cacheUser(any));
    });

    test("throws exception when status code is not 200", () async {
      // arrange
      when(localDataSource.getCachedUser()).thenAnswer((_) async => null);

      when(
        mockHttpClient.post(
          any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response('Something went wrong', 404));

      // act & assert
      expect(
        () async =>
            await dataSource.login(TestData.tUsername, TestData.tPassword),
        throwsA(isA<Exception>()),
      );

      // verify no caching on error
      verifyNever(localDataSource.cacheUser(any));
    });
  });

  group("register/signup test", () {
    test("test register when succesfully registered", () async {
      // arrange
      when(
        localDataSource.cacheUser(any),
      ).thenAnswer((_) async {}); // for Future<void>
      when(
        mockHttpClient.post(
          any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(TestData.response, 201));

      // act
      final result = await dataSource.register(
        TestData.tUsername,
        TestData.tEmail,
        TestData.tPassword,
      );

      // assert
      expect(result, isA<UserModel>());
      expect(result, TestData.tUserModel);

      //verify
      verify(localDataSource.cacheUser(TestData.tUserModel)).called(1);
    });

    test("test register when registration fails", () async {
      //arrange
      when(
        localDataSource.cacheUser(any),
      ).thenAnswer((_) async {}); // for Future<void>
      when(
        mockHttpClient.post(
          any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response("Error", 403));

      //act & assert
      expect(
        () async => await dataSource.register(
          TestData.tUsername,
          TestData.tEmail,
          TestData.tPassword,
        ),
        throwsA(isA<Exception>()),
      );

      //verify
      verifyNever(localDataSource.cacheUser(any));
    });
  });


  // group("logout test", (){
  //   test("Logout succesful", () async{
  //     //arrange

  //   });
  // });

  //TODO implement logout on backend come back here




}
