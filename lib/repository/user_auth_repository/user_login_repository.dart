import 'package:sporter_turf_booking/data/network/http_api_service.dart';
import 'package:sporter_turf_booking/data/network/network_api_service.dart';

import '../../user_registration/model/user_login_model.dart';

class UserLoginRepository {
  HttpApiServices apiServices = NetWorkApiServices();

  Future getUserLogin({required String url, required Map body}) async {
    try {
      final response = await apiServices.httpPostMethod(url: url, data: body);

      return userLoginModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
