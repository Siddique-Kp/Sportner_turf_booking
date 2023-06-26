import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/my_bookings_view_model.dart';
import 'package:sporter_turf_booking/home/view_model/user_profile_view_model.dart';
import 'package:sporter_turf_booking/repository/refund_repository.dart';
import '../../utils/constants.dart';

class RefundViewModel with ChangeNotifier {
  final _myRepo = RefundRepository();

  Future<bool> getBookingCancellation(
    String bookingId,
    BuildContext context,
  ) async {
    bool isCancellationSuccess = false;
    final udataBookingData = context.read<MyBookingsViewModel>();
    final updateUserData = context.read<UserProfileViewModel>();

    _myRepo
        .getRefund(Urls.kBooking + bookingId + Urls.kRefund)
        .then(
          (value) => {
            isCancellationSuccess = true,
            udataBookingData.getMyBookingsDatas(),
            updateUserData.getUserProfileData(),
          },
        )
        .onError(
          (error, stackTrace) => {
            isCancellationSuccess = false,
          },
        );

    return isCancellationSuccess;
  }
}
