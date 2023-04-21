import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/bottom_nav_view_model.dart';
import 'package:sporter_turf_booking/home/view_model/venue_list_view_model.dart';
import 'package:sporter_turf_booking/user_registration/view_model/firebase_auth_view_model.dart';
import 'package:sporter_turf_booking/user_registration/view_model/forget_password_view_model.dart';
import 'package:sporter_turf_booking/user_registration/view_model/user_login_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/user_registration/view_model/sign_up_view_model.dart';
import 'package:sporter_turf_booking/utils/routes/navigations.dart';

import 'home/view_model/booking_slot_view_model.dart';
import 'home/view_model/get_location_view_model.dart';
import 'home/view_model/venue_details_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
      ],
      child: GetMaterialApp(
        title: 'sportner turf booking app',
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          );
        },
        theme: ThemeData(
            // splashColor: Colors.transparent,
            // highlightColor: Colors.transparent,
            // hoverColor: Colors.transparent,
            scaffoldBackgroundColor: AppColors.scaffoldColor,
            // primarySwatch: PrimaryColor.appColor,
            primaryColor: AppColors.appColor,
            elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(AppColors.kButtonColor),
              ),
            ),
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.black),
              // backgroundColor: AppColors.white,
                titleTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
                elevation: 0)),
        routes: NavigatorClass.routes(),
        initialRoute: NavigatorClass.splashScreen,
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
