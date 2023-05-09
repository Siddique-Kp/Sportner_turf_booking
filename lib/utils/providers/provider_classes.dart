import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sporter_turf_booking/home/view_model/my_bookings_view_model.dart';

import '../../home/view_model/booking_slot_view_model.dart';
import '../../home/view_model/bottom_nav_view_model.dart';
import '../../home/view_model/get_location_view_model.dart';
import '../../home/view_model/proceed_payment_view_model.dart';
import '../../home/view_model/user_profile_view_model.dart';
import '../../home/view_model/venue_by_sport_view_model.dart';
import '../../home/view_model/venue_details_view_model.dart';
import '../../home/view_model/venue_list_view_model.dart';
import '../../user_registration/view_model/firebase_auth_view_model.dart';
import '../../user_registration/view_model/forget_password_view_model.dart';
import '../../user_registration/view_model/sign_up_view_model.dart';
import '../../user_registration/view_model/user_login_view_model.dart';

class ProviderClass {
 static List<SingleChildWidget> provider = [
    ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => UserLoginViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => FirebaseAuthViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => BottomNavViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ForgetPassViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => BookingSlotViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => VenueListViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => VenueDetailsViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => GetLocationViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => UserProfileViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => VenueBySportViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProceedPaymentViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => MyBookingsViewModel(),
    ),
  ];
}
