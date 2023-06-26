import 'package:sporter_turf_booking/data/network/http_api_service.dart';
import 'package:sporter_turf_booking/data/network/network_api_service.dart';
import '../home/model/user_profile_data_modle.dart';

class UserProfileRepository {
  HttpApiServices apiServices = NetWorkApiServices();

  Future<dynamic> getUserProfile(String url) async {
    try {
      final response =
          await apiServices.httpGetMethod(url: url, haveHeader: true);
      return userProfileDataModleFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
