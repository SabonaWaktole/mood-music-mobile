import 'dart:convert';
import 'dart:core';
import 'package:mood_music_mobile/features/auth/data/datasources/local_data_source.dart';
import 'package:mood_music_mobile/features/auth/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import '../../../../injection.dart';

abstract class RemoteDataSource {
  Future<UserModel> login(String username, String password);
  Future<void> logout(String token);
  Future<UserModel> register(String username, String email, String password);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  LocalDataSource localDataSource;      
  RemoteDataSourceImpl({required this.client, required this.localDataSource});
  static const String baseUrl = Injection.baseUrl;
  @override
  Future<UserModel> login(String username, String password) async {
    // Check if the user is aready logged in
    //if yes, return the cached user
    //if no, make a network request to login

    UserModel? cachedUser = await localDataSource.getCachedUser();
    if (cachedUser != null) {
      return cachedUser;
    }
    final response = await client.post(
      Uri.parse('$baseUrl/public/login'),
      headers: {'Content-Type': 'application/json'},
      body: '{"username": "$username", "password": "$password"}',
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = 
          response.body.isNotEmpty ? 
          Map<String, dynamic>.from(jsonDecode(response.body)) : {};
          UserModel userModel =  UserModel.fromJson(jsonResponse);
          localDataSource.cacheUser(userModel);
      return userModel;
    } else {
      throw Exception('Failed to login: ${response.reasonPhrase}');
    }
  }

  @override
  Future<void> logout(String token) {
    // Since we are using token based authentication, there is no need to make a network request to logout
    // Just clear the cached user
    return localDataSource.clearCachedUser();
  }

  @override
  Future<UserModel> register(String username, String email, String password) async {
    final response = await client.post(
      Uri.parse('$baseUrl/public/register'),
      headers: {'Content-Type': 'application/json'},
      body: '{"username": "$username", "email": "$email", "password": "$password"}',
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = 
          response.body.isNotEmpty ? 
          Map<String, dynamic>.from(jsonDecode(response.body)) : {};
          final UserModel registeredUser = UserModel.fromJson(jsonResponse);
          localDataSource.cacheUser(registeredUser);
      return registeredUser;
    } else {
      throw Exception('Failed to register: ${response.reasonPhrase}');
    }
  }
}
