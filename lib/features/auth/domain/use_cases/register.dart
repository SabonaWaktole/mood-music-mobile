import 'package:mood_music_mobile/core/usecase/usecase.dart';
import 'package:mood_music_mobile/core/utils/entity_model_conv.dart';
import 'package:mood_music_mobile/features/auth/data/model/user_model.dart';
import 'package:mood_music_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mood_music_mobile/features/auth/domain/repositories/user_repo.dart';

class Register implements Usecase<UserEntity, RegisterParams> {
  final UserRepo repository;
  final EntityModelConv conv;
  Register(this.repository, this.conv);
  @override
  Future<UserEntity> call(RegisterParams params) async {
    UserModel user = await repository.register(params.username, params.email, params.password);
    return conv.toEntity(user);
  }
}

class RegisterParams {
  final String username;
  final String email;
  final String password;
  RegisterParams({
    required this.username,
    required this.email,
    required this.password,
  });
}
