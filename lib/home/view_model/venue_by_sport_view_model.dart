import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/data/response/api_response.dart';
import 'package:sporter_turf_booking/home/model/venue_by_sport_model.dart';
import 'package:sporter_turf_booking/repository/venue_by_sports_repository.dart';
import '../../utils/constants.dart';

class VenueBySportViewModel with ChangeNotifier {
  final _myRepo = VenueBySportsRepository();
  ApiResponse<List<VenueBySportModel>> _venueBySportModel =
      ApiResponse.loading();
  ApiResponse<List<VenueBySportModel>> get venueDataModel => _venueBySportModel;

  getVenueBySportDatas(String sport) async {
    setVenueBySportData(ApiResponse.loading());
    _myRepo
        .getVenueBySports(Urls.kGETVENUEBYSPORT + sport)
        .then(
          (value) => {
            setVenueBySportData(
              ApiResponse.completed(value),
            ),
          },
        )
        .onError(
          (error, stackTrace) => {
            setVenueBySportData(
              ApiResponse.error(error.toString()),
            ),
          },
        );
  }

  setVenueBySportData(
      ApiResponse<List<VenueBySportModel>> venueDataModel) async {
    _venueBySportModel = venueDataModel;
    notifyListeners();
  }
}
