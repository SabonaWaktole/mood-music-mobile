import 'package:mood_music_mobile/features/auth/data/model/user_model.dart';
import 'package:mood_music_mobile/features/auth/domain/entities/user_entity.dart';

class EntityModelConv {

  UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      username: entity.name,
      email: entity.email,
      token: entity.token,
    );
  }

  UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.username,
      email: model.email,
      token: model.token,
    );
  }
}