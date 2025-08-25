// test/mock_generator.dart
//
// Adjust the import below to the actual path of your LocalDataSource implementation.
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mood_music_mobile/features/auth/data/datasources/local_data_source.dart';

@GenerateMocks([LocalDataSource, http.Client])
void main() {}
//
// After creating this file run:
// flutter pub run build_runner build --delete-conflicting-outputs
// This will generate `test/mock_generator.mocks.dart` containing MockLocalDataSource.