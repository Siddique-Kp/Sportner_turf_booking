import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/my_bookings_view_model.dart';
import 'package:sporter_turf_booking/home/view_model/user_profile_view_model.dart';
import '../../repo/api_services.dart';
import '../../repo/api_status.dart';
import '../../utils/constants.dart';

class RefundViewModel with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> getBookingCancellation(
      String bookingId, BuildContext context) async {
    setLoading(true);
    bool isCancellationSuccess = false;
    final bookingData = context.read<MyBookingsViewModel>();
    final userData = context.read<UserProfileViewModel>();
    final accessToken = await AccessToken.getAccessToken();
    final response = await ApiServices.getMethod(
        url: Urls.kBooking + bookingId + Urls.kRefund,
        headers: {"Authorization": accessToken!});
    if (response is Success) {
      log("Success");
      isCancellationSuccess = true;
      bookingData.getMyBookingsDatas();
      // setRefundBooking(bookingData, bookingId);
      userData.getUserProfileData();
      setLoading(false);
    }
    if (response is Failure) {
      log(response.code.toString());
      log("Error");
      setLoading(false);
      isCancellationSuccess = false;
    }
    setLoading(false);
    return isCancellationSuccess;
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // setRefundBooking(MyBookingsViewModel bookingData, String bookingId) {
  //   if (bookingData.myBookingsList.any((element) => element.id == bookingId)) {
  //     log("function came here");
  //     final index = bookingData.myBookingsList
  //         .indexWhere((element) => element.id == bookingId);

  //     bookingData.myBookingsList[index].refund = "processed";
  //   }
  //   notifyListeners();
  // }
}
