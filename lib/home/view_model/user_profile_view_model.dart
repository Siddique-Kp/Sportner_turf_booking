import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/data/response/api_response.dart';
import 'package:sporter_turf_booking/home/model/user_profile_data_modle.dart';
import 'package:sporter_turf_booking/repository/user_profile_repository.dart';
import '../../utils/constants.dart';

class UserProfileViewModel with ChangeNotifier {
  UserProfileViewModel() {
    getUserProfileData();
  }

  final _myRepo = UserProfileRepository();
  ApiResponse<UserProfileDataModle>? _userProfileModel;
  ApiResponse<UserProfileDataModle>? get userProfileModel => _userProfileModel;

 Future<void> getUserProfileData() async {
    setUserProfileData(ApiResponse.loading());
    _myRepo
        .getUserProfile(Urls.kGETUSERPROFILE)
        .then(
          (value) => {
            setUserProfileData(
              ApiResponse.completed(value),
            ),
          },
        )
        .onError(
          (error, stackTrace) => {
            setUserProfileData(
              ApiResponse.error(error.toString()),
            ),
          },
        );
  }

  setUserProfileData(ApiResponse<UserProfileDataModle> userData) async {
    _userProfileModel = userData;
    notifyListeners();
  }
}
