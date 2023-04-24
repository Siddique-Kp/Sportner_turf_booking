import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporter_turf_booking/home/model/user_profile_data_modle.dart';
import 'package:sporter_turf_booking/utils/keys.dart';
import '../../repo/api_services.dart';
import '../../repo/api_status.dart';
import '../../utils/constants.dart';

class UserProfileViewModel with ChangeNotifier {
  UserProfileDataModle? _userProfileData;
  bool _isLoading = false;

  UserProfileDataModle? get userProfileData => _userProfileData;
  bool get isLoading => _isLoading;

  Future<UserProfileDataModle>? getUserProfileData() async {
    setLoading(true);
    final accessToken = await getAccessToken();
    final response = await ApiServices.getMethod(
      url: Urls.kGETUSERPROFILE,
      headers: {"Authorization": accessToken!},
      jsonDecod: userProfileDataModleFromJson,
    );

    if (response is Success) {
      log("response success");
      log("Got data");
      setLoading(false);
      return await setUserProfileData(
          response.response as UserProfileDataModle);
    }

    if (response is Failure) {
      log("Single response error");
      setLoading(false);
    }
    return
    setLoading(false);
  }

  setUserProfileData(UserProfileDataModle userData) async {
    _userProfileData = userData;
    notifyListeners();
    return _userProfileData;
  }

  setLoading(bool loading) {
    _isLoading = loading;
    // notifyListeners();
  }

  Future<String?> getAccessToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    final accessToken = sharedPref.getString(GlobalKeys.accesToken);

    return accessToken;
  }
}
