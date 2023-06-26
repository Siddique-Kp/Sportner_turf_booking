import 'package:sporter_turf_booking/data/network/http_api_service.dart';
import 'package:sporter_turf_booking/data/network/network_api_service.dart';
import '../home/model/my_bookings_model.dart';

class MyBookingsRepository {
  HttpApiServices apiServices = NetWorkApiServices();

  Future<dynamic> getMyBookings(String url) async {
    try {
      final response =
          await apiServices.httpGetMethod(url: url, haveHeader: true);
      return myBookingsModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
