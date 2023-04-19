class Urls {
  static const String kBASEURL = "http://192.168.224.151:5000";
  static const String kUSERSIGNIN = "$kBASEURL/signin";
  static const String kUSERSIGNUP = "$kBASEURL/signup";
  static const String kFORGOTPASSmob = "$kBASEURL/forgotPwd/mobileExist?mobile=";
  static const String kFORGOTPASS = "$kBASEURL/forgotPwd";
  static const String kGETALLVENUE = "$kBASEURL/venues";
  static const String kGETSINGLEVENUE = "$kBASEURL/venue/";
}

class InvalidRespons {
  static const kUSERINVALIDRESPONSE = 100;
  static const kNOINTERNET = 101;
  static const kINVALIDFORMAT = 102;
  static const kUNKNOWNERROR = 103;
  static const kTIMEOUT = 104;
}
