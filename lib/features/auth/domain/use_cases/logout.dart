import 'package:mood_music_mobile/core/usecase/usecase.dart';
import 'package:mood_music_mobile/features/auth/domain/repositories/user_repo.dart';

class Logout implements Usecase<void, NoParams>{
  final UserRepo repository;
  Logout(this.repository);
  @override
  Future<void> call(NoParams params) async{
    return await repository.logout("");
  }
}

