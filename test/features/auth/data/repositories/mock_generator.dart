
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mood_music_mobile/features/auth/data/datasources/local_data_source.dart';
import 'package:mood_music_mobile/features/auth/data/datasources/remote_data_source.dart';

// Generate mocks
@GenerateMocks([
  LocalDataSource,
  RemoteDataSource,
  http.Client,
  FlutterSecureStorage,
])
void main() {}
