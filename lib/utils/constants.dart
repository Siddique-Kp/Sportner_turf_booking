import 'package:shared_preferences/shared_preferences.dart';
import 'keys.dart';

class Urls {
  static const String kBASEURL = "https://enturfapi.onrender.com";
  static const String kUSERSIGNIN = "$kBASEURL/signin";
  static const String kUSERSIGNUP = "$kBASEURL/signup";
  static const String kIsMobileExist = "$kBASEURL/mobileExist";
  static const String kGoogleSIGNIN = "$kBASEURL/signin/google";
  static const String kFORGOTPASSmob =
      "$kBASEURL/forgotPwd/mobileExist?mobile=";
  static const String kFORGOTPASS = "$kBASEURL/forgotPwd";
  static const String kGETALLVENUE = "$kBASEURL/venues";
  static const String kGETVENUEBYSPORT = "$kBASEURL/venues/";
  static const String kGETSINGLEVENUE = "$kBASEURL/venue/";
  static const String kGETUSERPROFILE = "$kBASEURL/profile";
  static const String kGETSLOTAVAILABILITY = "$kBASEURL/bookedSlot";
  static const String kGETORDERID = "$kBASEURL/book";
  static const String kGETPROCEEDPAYMENT = "$kBASEURL/verifyPayment";
  static const String kGETMYBOOKINGS = "$kBASEURL/bookings";
  static const String kBooking = "$kBASEURL/booking/";
  static const String kRefund = "/refund";
}

class AccessToken {
  static Future<String?> getAccessToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    final accessToken = sharedPref.getString(GlobalKeys.accesToken);
    return accessToken;
  }
}


