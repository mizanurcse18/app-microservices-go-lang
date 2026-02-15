class ApiEndpoint {
  static const String baseUrl = 'http://10.0.2.2:8080';
  static const String apiPrefix = '/api';
  static const String apiVersion = '/v1';

  // Modules
  static const String authModule = '/auth';
  static const String hrmsModule = '/hrms';
  static const String securityModule = '/security';
  static const String crmModule = '/crm';

  // Full Path Constructor
  static String buildPath({
    required String module,
    required String method,
    String? prefix,
    String? version,
  }) {
    final p = prefix ?? apiPrefix;
    final v = version ?? apiVersion;
    return '$module$p$v$method';
  }

  // Specific Endpoints
  static String get login => buildPath(module: authModule, method: '/login');
}
