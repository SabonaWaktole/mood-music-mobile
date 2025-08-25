import 'package:mood_music_mobile/core/usecase/usecase.dart';
import 'package:mood_music_mobile/core/utils/entity_model_conv.dart';
import 'package:mood_music_mobile/features/auth/data/model/user_model.dart';
import 'package:mood_music_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mood_music_mobile/features/auth/domain/repositories/user_repo.dart';

class Login implements Usecase<UserEntity, LoginParams>{
  final UserRepo repository;
  final EntityModelConv conv;
  Login(this.repository, this.conv);
  @override
  Future<UserEntity> call(LoginParams params) async {
    UserModel user = await repository.login(params.username, params.password);
    return conv.toEntity(user);
  }
}

class LoginParams{
  final String username;
  final String password;
  LoginParams({required this.username, required this.password});
}
