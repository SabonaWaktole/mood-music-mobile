import 'package:mood_music_mobile/features/auth/data/model/user_model.dart';
import 'package:mood_music_mobile/features/auth/domain/entities/user_entity.dart';

class TestData {
  static const String tUserId = 'u123';
  static const String tUsername = 'johndoe';
  static const String tEmail = 'johndoe@example.com';
  static const String tPassword = 'password123';
  static const String tToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.dummy.signature';
  static const String response = '{"id":"u123","username":"johndoe","email":"johndoe@example.com","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.dummy.signature"}';

  static const Map<String, dynamic> tUserJson = {
    'id': tUserId,
    'username': tUsername,
    'email': tEmail,
    'token': tToken,
  };

  static const Map<String, dynamic> tUserModelMap = {
    'id': tUserId,
    'username': tUsername,
    'email': tEmail,
    'token': tToken,
  };

  static const UserEntity tUserEntity = UserEntity(
    id: tUserId,
    name: tUsername,
    email: tEmail,
    token: tToken,
  );

  static final UserModel tUserModel = UserModel(
    id: tUserId,      
    username: tUsername,
    email: tEmail,
    token: tToken,
  );
}
