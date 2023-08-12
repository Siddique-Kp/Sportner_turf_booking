import 'package:sporter_turf_booking/data/network/http_api_service.dart';
import 'package:sporter_turf_booking/data/network/network_api_service.dart';
import '../../user_authentications/model/user_signup_model.dart';

class UserSignUpRepository {
  HttpApiServices apiServices = NetWorkApiServices();

  Future getUserSignUp({
    required String url,
    required Map body,
  }) async {
    try {
      final response = await apiServices.httpPostMethod(url: url, data: body);
      return userSignupModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future getIsMobielExist({
    required String url,
    required Map body,
  }) async {
    try {
      final response = await apiServices.httpPostMethod(url: url, data: body);
      return response["message"];
    } catch (e) {
      rethrow;
    }
  }
}
