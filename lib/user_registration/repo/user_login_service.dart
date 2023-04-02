import 'package:sporter_turf_booking/user_registration/view/login_view.dart';
import 'package:sporter_turf_booking/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserLogInService {
  static Future userSiginin() async {
    final uri = Uri.parse(Urls.BASE_URL + Urls.USER_SIGNIN);

    final response = await http.post(uri, body: {
      "mobile": loginPhoneController.text,
      "password": loginPassController.text
    });

    if (response.statusCode == 200) {
  
   
    }

  }
}
