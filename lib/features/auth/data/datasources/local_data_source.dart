import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mood_music_mobile/features/auth/data/model/user_model.dart';

abstract class LocalDataSource {
  Future<void> cacheUser(UserModel userModel);
  Future<UserModel?> getCachedUser();
  Future<void> clearCachedUser();
}

class LocalDataSourceImpl implements LocalDataSource {
  UserModel? cachedUser;
  final FlutterSecureStorage storage;
  LocalDataSourceImpl({required this.storage});

  @override
  Future<void> cacheUser(UserModel userModel) async {
    cachedUser = userModel;
    await storage.write(key: 'cached_user', value: userModel.toJson().toString());
  }

  @override
  Future<UserModel?> getCachedUser() async {

    if(cachedUser != null) {
      return cachedUser;
    }
    final userJsonString = await storage.read(key: 'cached_user');
    if (userJsonString != null) {
      final Map<String, dynamic> userMap = 
          Map<String, dynamic>.from(jsonDecode(userJsonString));
      return UserModel.fromJson(userMap);
    }
    return null;
  }

  @override
  Future<void> clearCachedUser() async {
    cachedUser = null;
    await storage.delete(key: 'cached_user');
  }
}