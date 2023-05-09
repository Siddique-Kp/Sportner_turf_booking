import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporter_turf_booking/home/model/my_bookings_model.dart';
import '../../repo/api_services.dart';
import '../../repo/api_status.dart';
import '../../utils/constants.dart';
import '../../utils/keys.dart';

class MyBookingsViewModel with ChangeNotifier {
  MyBookingsViewModel() {
    getMyBookingsDatas();
  }
  List<MyBookingsModel> _myBookingsList = [];
  bool _isLoading = false;

  List<MyBookingsModel> get myBookingsList => _myBookingsList;
  bool get isLoading => _isLoading;

  getMyBookingsDatas() async {
    setLoading(true);
    final accessToken = await getAccessToken();
    final response = await ApiServices.getMethod(
      url: Urls.kGETMYBOOKINGS,
      jsonDecod: myBookingsModelFromJson,
      headers: {"Authorization":accessToken!}
    );
    if (response is Success) {
      if (response.response != null) {
        await setMyBookingsData(response.response as List<MyBookingsModel>);
      }
      log("Success");
      log(response.response.toString());
      setLoading(false);
    }
    if (response is Failure) {
      log("Error");
      setLoading(false);
    }
    setLoading(false);
  }

  setMyBookingsData(List<MyBookingsModel> myBookings) async {
    _myBookingsList = myBookings;
    notifyListeners();
  }

  setLoading(bool loading) {
    _isLoading = loading;
  }

    Future<String?> getAccessToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    final accessToken = sharedPref.getString(GlobalKeys.accesToken);
    return accessToken;
  }
}
