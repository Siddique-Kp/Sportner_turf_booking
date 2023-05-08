import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporter_turf_booking/home/model/payment_model.dart';
import 'package:sporter_turf_booking/home/model/proceed_payment_model.dart';
import 'package:sporter_turf_booking/home/view_model/venue_details_view_model.dart';
import 'package:sporter_turf_booking/utils/routes/get_it_locator.dart';
import 'package:sporter_turf_booking/utils/routes/navigation_services.dart';
import 'package:sporter_turf_booking/utils/routes/navigations.dart';
import '../../repo/api_services.dart';
import '../../repo/api_status.dart';
import '../../utils/constants.dart';
import '../../utils/keys.dart';
import '../model/razor_pay_model.dart';
import '../model/slot_availability_model.dart';
import '../model/venue_data_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BookingSlotViewModel with ChangeNotifier {
  BookingSlotViewModel() {
    DateTime now = DateTime.now();
    for (int i = 0; i < 5; i++) {
      _dates.add(now.add(Duration(days: i)));
    }
    _selectedDate = now;
  }

  final NavigationServices _navigationServices = locator<NavigationServices>();

  List<SlotAvailabilityModel> _slotAvailability = [];
  int _selectedSport = -1;
  String _selectedSportName = "";
  DateTime? _selectedDate;
  final List<DateTime> _dates = [];
  String _selectedRadioButton = "";
  String _facility = "";
  String _selectedTime = "HH:MM";
  List<Slots> venueDataSlot = [];
  int fromTimeSlotIndex = -1;
  String timeSlotText = "";

  List<SlotAvailabilityModel> get slotAvailability => _slotAvailability;
  int get selectedSport => _selectedSport;
  String get selectedSportName => _selectedSportName;
  DateTime? get selectedDate => _selectedDate;
  List<DateTime> get dates => _dates;
  String get selectedRadioButton => _selectedRadioButton;
  String get facility => _facility;
  String get selectedTime => _selectedTime;

  /// RAZORPAY PAYMENT METHOD
  final _razorpay = Razorpay();
  RazorPayModel? razorPayOrderModel;
  String? paymentId;
  String? orderId;
  String? signature;
  VenueDataModel? _venuData;

  getVenueData(VenueDataModel venueData) {
    _venuData = venueData;
    notifyListeners();
  }

  openPayment({required RazorPayModel razorPayModel}) {
    log(razorPayModel.order!.toJson().toString());
    final options = {
      'key': 'rzp_test_byX4xjQdkJOyzX',
      'amount': razorPayModel.order!.amount,
      'name': 'Sportner App',
      'order_id': razorPayModel.order!.id,
      'description': 'Turf booking',
      'timeout': 60,
      'prefill': {
        'contact': '9123456789',
        'email': 'sportner@turf.com',
      }
    };
    try {
      _razorpay.open(options);
      razorPayPayment();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  razorPayPayment() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    paymentId = response.paymentId;
    orderId = response.orderId;
    signature = response.signature;
    getProceedPayment();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  /// PROCEED PAYMENT AND COMPLETE

  Map<String, dynamic> proceedPaymentBody() {
    final slotData = DateFormat('d,MMM,y').format(
      DateTime.parse('$_selectedDate'),
    );
    final body = ProceedPaymentModel(
      razorpayOrderId: orderId,
      razorpayPaymentId: paymentId,
      razorpaySignature: signature,
      turfId: _venuData!.sId,
      facility: _selectedRadioButton,
      slotDate: slotData,
      price: _venuData!.actualPrice.toString(),
      slotTime: _selectedTime,
      sport: _selectedSportName,
    );
    log(body.toJson().toString());
    return body.toJson();
  }

  getProceedPayment() async {
    final accessToken = await getAccessToken();
    final response = await ApiServices.postMethod(
        url: Urls.kGETPROCEEDPAYMENT,
        body: proceedPaymentBody(),
        headers: {"Authorization": accessToken!});
    if (response is Success) {
      _navigationServices
          .pushAndRemoveUntilTo(NavigatorClass.paymentSuccessView);
      log("Success");
      log(response.response.toString());
    }
    if (response is Failure) {
      log("Error");
    }
  }

  /// GER ORDER RESPONSE TO PAY THROUGH THE RAZORPAY

  Map<String, dynamic> paymentModelBody(String venueId, String method) {
    final slotData = DateFormat('d,MMM,y').format(
      DateTime.parse('$_selectedDate'),
    );
    final body = PaymentModel(
      turf: venueId,
      method: method,
      sport: _selectedSportName,
      slotTime: _selectedTime,
      facility: _selectedRadioButton,
      slotDate: slotData,
    );
    log(body.toJson().toString());
    return body.toJson();
  }

  getOrderModel({
    required String venueId,
  }) async {
    final accessToken = await getAccessToken();
    final response = await ApiServices.postMethod(
        url: Urls.kGETORDERID,
        body: paymentModelBody(venueId, "online"),
        jsonDecode: razorPayModelFromJson,
        headers: {"Authorization": accessToken!});
    if (response is Success) {
      if (response.response != null) {
        await setOrderModelResponse(response.response as RazorPayModel);
      }
      log("Success");
      log(response.response.toString());
    }
    if (response is Failure) {
      log("Error");
    }
  }

  setOrderModelResponse(RazorPayModel orderModel) async {
    razorPayOrderModel = orderModel;
    if (razorPayOrderModel != null) {
      openPayment(razorPayModel: razorPayOrderModel!);
    }
    notifyListeners();
  }

  // GET THE SLOTS AVAILABILITY

  getSlotAvailability({
    required String venueId,
  }) async {
    final date = DateFormat('d,MMM,y').format(
      DateTime.parse('$_selectedDate'),
    );
    log(date);
    final response = await ApiServices.postMethod(
      url: Urls.kGETSLOTAVAILABILITY,
      body: {
        "turfId": venueId,
        "slotDate": date,
      },
      jsonDecode: slotAvailabilityModelFromJson,
    );
    if (response is Success) {
      if (response.response != null) {
        await setSlotAvailability(
            response.response as List<SlotAvailabilityModel>);
      }
      log("Success");
      log(response.response.toString());
    }
    if (response is Failure) {
      log("Error");
    }
  }

  setSlotAvailability(List<SlotAvailabilityModel> slotAvailability) async {
    _slotAvailability = slotAvailability;
    notifyListeners();
  }

  // Selected sport controller ---------

  setSelectedSport(int index, String facility, String sportName) {
    _selectedSport = index;
    _selectedSportName = sportName;
    _facility = facility;
    clearRadioValue();
    notifyListeners();
  }

  // Radio button controller -----------

  setRadioButton(String selectedButton) {
    _selectedRadioButton = selectedButton;
    notifyListeners();
  }

  clearRadioValue() {
    _selectedRadioButton = "";
  }

  // Date format controller ---------------

  setSelectedDate(DateTime? selectedDate, String venueId) {
    _selectedDate = selectedDate;
    getSlotAvailability(venueId: venueId);
    clearSelectedTime();
    notifyListeners();
  }

  setDate(DateTime selectedDate, venueId) {
    _selectedDate = selectedDate;
    _dates.clear();
    for (int i = 0; i < 5; i++) {
      _dates.add(selectedDate.add(Duration(days: i)));
    }
    getSlotAvailability(venueId: venueId);
    clearSelectedTime();
    notifyListeners();
  }

  // Time slot controller ----------------

  setSelectedTime(String selectedTime) {
    _selectedTime = selectedTime;
    notifyListeners();
  }

  clearSelectedTime() {
    _selectedTime = "HH:MM";
  }

  // CHECK SELECTED ALL FACILITY NEEDED

  checkBookingSelection() {
    if (_selectedDate == null ||
        _facility == "" ||
        _selectedRadioButton == "" ||
        _selectedSport == -1 ||
        _selectedTime == "HH:MM") {
      return false;
    }

    return true;
  }

  // Convert to 12 hours
  String convertTo12HourFormat(String time24) {
    if (time24 == "HH:MM") {
      return time24;
    }
    DateTime time = DateFormat('HH:mm').parse(time24);

    String time12 = DateFormat('h:mm a').format(time);

    return time12;
  }

  bool canSelectTimeSlot(
      {required bool isFromSlot,
      required int slotIndex,
      required BuildContext context}) {
    final venueViewModel = context.watch<VenueDetailsViewModel>();
    venueDataSlot = venueViewModel.venueData.slots!;
    timeSlotText = isFromSlot == true
        ? venueDataSlot[venueViewModel.dayIndex]
            .slots![slotIndex]
            .split("-")
            .first
        : venueDataSlot[venueViewModel.dayIndex]
            .slots![slotIndex]
            .split("-")
            .last;
    if (isFromSlot == false &&
        _selectedTime.isNotEmpty &&
        _selectedTime.contains(
          _selectedTime.split("-").last,
        )) {
      fromTimeSlotIndex =
          venueDataSlot[venueViewModel.dayIndex].slots!.indexWhere(
                (element) =>
                    element.split("-").last == _selectedTime.split("-").last,
              );
    }

    final parsedTimeOnly = DateFormat('HH:mm').parse(timeSlotText);
    final now = DateTime.now();
    final parsedDateTime = DateTime(
      _selectedDate?.year ?? now.year,
      _selectedDate?.month ?? now.month,
      _selectedDate?.day ?? now.day,
      parsedTimeOnly.hour,
      parsedTimeOnly.minute,
    );

    if (!isFromSlot && fromTimeSlotIndex == slotIndex ||
        isFromSlot && parsedDateTime.isAfter(now)) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> getAccessToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    final accessToken = sharedPref.getString(GlobalKeys.accesToken);
    return accessToken;
  }
}
