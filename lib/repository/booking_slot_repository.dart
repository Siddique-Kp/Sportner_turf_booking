import 'package:sporter_turf_booking/data/network/http_api_service.dart';
import 'package:sporter_turf_booking/data/network/network_api_service.dart';

import '../home/model/slot_availability_model.dart';

class BookingSlotRepository {
  HttpApiServices apiServices = NetWorkApiServices();

  Future<dynamic> getAvailableSlot({required String url,required Map body}) async {
    try {
      final response = await apiServices.httpPostMethod(url: url,data: body);
      return slotAvailabilityModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
