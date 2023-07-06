import 'dart:developer';

import 'package:sporter_turf_booking/data/network/http_api_service.dart';
import 'package:sporter_turf_booking/data/network/network_api_service.dart';

class ForgotPasswordRepoitory {
  HttpApiServices apiServices = NetWorkApiServices();

  Future<dynamic> getForgotPass({
    required String url,
  }) async {
    try {
      await apiServices.httpGetMethod(url: url);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> setNewPass({
    required String url,
    required Map body,
  }) async {
    log(body.toString());
    try {
      await apiServices.httpPostMethod(url: url, data: body);
    
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
