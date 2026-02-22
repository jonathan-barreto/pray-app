import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/core/consts/app_endpoints.dart';
import 'package:pray_app/app/core/http_client/http_client.dart';
import 'package:pray_app/app/data/models/dashboard_response_model.dart';

abstract class DashboardDataSource {
  Future<DashboardResponseModel> getDashboard();
}

class DashboardDataSourceImpl implements DashboardDataSource {
  final HttpClient _httpClient;

  DashboardDataSourceImpl({required HttpClient httpClient})
      : _httpClient = httpClient;

  @override
  Future<DashboardResponseModel> getDashboard() async {
    try {
      final currentLocale = AppController.instance.locale;
      final languageCode = currentLocale?.languageCode ?? 'pt';

      final HttpResponse response = await _httpClient.get(
        endpoint: AppEndpoints.dashboard,
        queryParameters: {'language': languageCode},
      );

      return DashboardResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
