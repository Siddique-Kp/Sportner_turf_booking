import 'package:sporter_turf_booking/data/network/http_api_service.dart';
import 'package:sporter_turf_booking/data/network/network_api_service.dart';

import '../home/model/venue_data_model.dart';

class VenueDetailsRepository {
  HttpApiServices apiServices = NetWorkApiServices();

  Future getVenueDetails(String url) async {
    try {
      final response = await apiServices.httpGetMethod(url: url);
      return venueDataModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
