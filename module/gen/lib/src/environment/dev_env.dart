import 'package:envied/envied.dart';
import 'package:gen/src/environment/app_configuration.dart';

part 'dev_env.g.dart';

@Envied(path: 'asset/env/.dev.env', obfuscate: true)

/// Production environment variables
final class DevEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _DevEnv._baseUrl;

  @EnviedField(varName: 'API_KEY')
  static final String _loginApiKey = _DevEnv._loginApiKey;

  @override
  String get apiKey => _loginApiKey;

  @override
  String get baseUrl => _baseUrl;
}
