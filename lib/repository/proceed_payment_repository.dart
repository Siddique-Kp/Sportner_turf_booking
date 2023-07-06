import 'package:sporter_turf_booking/data/network/http_api_service.dart';
import 'package:sporter_turf_booking/data/network/network_api_service.dart';

import '../home/model/razor_pay_model.dart';

class ProceedPaymentRepository {
  HttpApiServices apiServices = NetWorkApiServices();

  Future<dynamic> getOrderModel(
      {required String url, required Map body}) async {
    try {
      final response = await apiServices.httpPostMethod(
        url: url,
        data: body,
        haveHeader: true,
      );
      return razorPayModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getProceedPayment({
    required String url,
    required Map body,
  }) async {
    try {
      final response = await apiServices.httpPostMethod(
        url: url,
        data: body,
        haveHeader: true,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
