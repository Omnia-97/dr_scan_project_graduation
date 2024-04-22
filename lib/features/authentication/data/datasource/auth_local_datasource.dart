import 'package:dr_scan_graduation_project/core/data/local/local_database_services.dart';
import 'package:dr_scan_graduation_project/core/data/local/local_database_constants.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final LocalDatabaseService localDatabaseService;
  AuthLocalDataSourceImpl(this.localDatabaseService);

  @override
  Future<void> cacheToken(String token) async {
    await localDatabaseService.saveData<String>(
        LocalDatabaseConstants.token, token);
  }

  @override
  Future<String?> getToken() async {
    return await localDatabaseService
        .loadData<String>(LocalDatabaseConstants.token);
  }

  @override
  Future<void> clearToken() {
    return localDatabaseService.deleteData(LocalDatabaseConstants.token);
  }
}
