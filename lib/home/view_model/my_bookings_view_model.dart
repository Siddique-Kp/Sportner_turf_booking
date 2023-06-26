import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/data/response/api_response.dart';
import 'package:sporter_turf_booking/home/model/my_bookings_model.dart';
import 'package:sporter_turf_booking/repository/my_bookings_repository.dart';
import '../../utils/constants.dart';

class MyBookingsViewModel with ChangeNotifier {
  MyBookingsViewModel() {
    getMyBookingsDatas();
  }

  final _myRepo = MyBookingsRepository();

  ApiResponse<List<MyBookingsModel>> _myBookingsModel = ApiResponse.loading();
  ApiResponse<List<MyBookingsModel>> get myBookingsModel => _myBookingsModel;

  Future<void> getMyBookingsDatas() async {
    setMyBookingsData(ApiResponse.loading());
    _myRepo
        .getMyBookings(Urls.kGETMYBOOKINGS)
        .then(
          (value) => {
            setMyBookingsData(
              ApiResponse.completed(value),
            ),
          },
        )
        .onError((error, stackTrace) => {
              setMyBookingsData(
                ApiResponse.error(error.toString()),
              ),
            });
  }

  setMyBookingsData(ApiResponse<List<MyBookingsModel>> myBookings) async {
    _myBookingsModel = myBookings;
    notifyListeners();
  }
}
