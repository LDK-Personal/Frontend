import 'package:flutter_login/Data/network/api_provider.dart';

class ApiClient {
  final bool enableLogging;
  late final ApiProviderFactory apiProvider;

  ApiClient({required this.enableLogging}) {
    apiProvider = ApiProviderFactory(enableLogging);
  }
}
