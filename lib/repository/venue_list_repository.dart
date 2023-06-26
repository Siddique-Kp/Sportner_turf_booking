import 'package:sporter_turf_booking/data/network/http_api_service.dart';
import 'package:sporter_turf_booking/data/network/network_api_service.dart';

import '../home/model/venue_data_model.dart';

class VenueListRepository {
  HttpApiServices apiServices = NetWorkApiServices();

  Future<dynamic> getVenueList(String url) async {
    try {
      final response = await apiServices.httpGetMethod(url: url);
      return venueDataModelListFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
