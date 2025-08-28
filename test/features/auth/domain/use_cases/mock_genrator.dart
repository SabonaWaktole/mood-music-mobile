// test/mock_generator.dart
//
// Adjust the import below to the actual path of your LocalDataSource implementation.
import 'package:mockito/annotations.dart';
import 'package:mood_music_mobile/core/utils/entity_model_conv.dart';
import 'package:mood_music_mobile/features/auth/data/datasources/local_data_source.dart';
import 'package:mood_music_mobile/features/auth/data/datasources/remote_data_source.dart';
import 'package:mood_music_mobile/features/auth/domain/repositories/user_repo.dart';
@GenerateMocks([UserRepo, LocalDataSource, RemoteDataSource, EntityModelConv])
void main() {}

//
// After creating this file run:
// flutter pub run build_runner build --delete-conflicting-outputs
// This will generate `test/mock_generator.mocks.dart` containing MockLocalDataSource.