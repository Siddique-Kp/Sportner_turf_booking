import 'package:sporter_turf_booking/data/network/http_api_service.dart';
import 'package:sporter_turf_booking/data/network/network_api_service.dart';

class RefundRepository {
  HttpApiServices apiServices = NetWorkApiServices();

  Future<dynamic> getRefund(String url) async {
    try {
      final response = await apiServices.httpGetMethod(url: url,haveHeader: true);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
