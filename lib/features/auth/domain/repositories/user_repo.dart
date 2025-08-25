import 'package:mood_music_mobile/features/auth/data/model/user_model.dart';

abstract class UserRepo {
  Future<UserModel> login(String username, String password);
  Future<void> logout(String token);
  Future<UserModel> register(String username, String email, String password);
  Future<UserModel?> getCachedUser();
  Future<void> clearCachedUser();
  Future<void> cacheUser(UserModel userModel);
}