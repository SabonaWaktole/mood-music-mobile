import 'package:mood_music_mobile/features/auth/data/datasources/local_data_source.dart';
import 'package:mood_music_mobile/features/auth/data/datasources/remote_data_source.dart';
import 'package:mood_music_mobile/features/auth/data/model/user_model.dart';
import 'package:mood_music_mobile/features/auth/domain/repositories/user_repo.dart';

class UserRepoImpl implements UserRepo{
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  UserRepoImpl({required this.localDataSource, required this.remoteDataSource});

  @override
  Future<void> cacheUser(UserModel userModel) async{
    await localDataSource.cacheUser(userModel);
  }

  @override
  Future<void> clearCachedUser() async{
    await localDataSource.clearCachedUser();
    
  }

  @override
  Future<UserModel?> getCachedUser() async{
    return await localDataSource.getCachedUser();
    
  }

  @override
  Future<UserModel> login(String username, String password) async{
    final user = await remoteDataSource.login(username, password);
    await localDataSource.cacheUser(user);
    return user;
    
  }

  @override
  Future<void> logout(String token) async{
    //TODO: Implement logout on backend
    // await remoteDataSource.logout(token);
    await localDataSource.clearCachedUser();
  }

  @override
  Future<UserModel> register(String username, String email, String password) async{
    final user = await remoteDataSource.register(username, email, password);
    await localDataSource.cacheUser(user);
    return user;
    
  }

}