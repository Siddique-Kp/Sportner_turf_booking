import 'package:sporter_turf_booking/data/network/http_api_service.dart';
import 'package:sporter_turf_booking/data/network/network_api_service.dart';
import 'package:sporter_turf_booking/home/model/venue_by_sport_model.dart';

class VenueBySportsRepository {
  HttpApiServices apiServices = NetWorkApiServices();

  Future getVenueBySports(String url) async {
    try {
      final response = await apiServices.httpGetMethod(url: url);
      return venueBySportModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
