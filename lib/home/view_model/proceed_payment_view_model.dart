import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';
import 'package:sporter_turf_booking/repo/api_services.dart';
import '../../repo/api_status.dart';
import '../../utils/constants.dart';
import '../../utils/routes/navigations.dart';
import '../model/payment_model.dart';
import '../model/proceed_payment_model.dart';
import '../model/razor_pay_model.dart';
import '../model/venue_data_model.dart';

class ProceedPaymentViewModel with ChangeNotifier {
  BookingSlotViewModel? _bookingData;
  final _razorpay = Razorpay();
  String? paymentId;
  String? orderId;
  String? signature;
  bool _isWallet = false;
  RazorPayModel? razorPayOrderModel;
  VenueDataModel? _venuData;
  bool _razorPayPaymentInitialized = false;


  bool get isWallet => _isWallet;

  setBookingData(BookingSlotViewModel bookingData) {
    _bookingData = bookingData;
    notifyListeners();
  }

  setPaymentMethod(bool? value) {
    _isWallet = !_isWallet;
    notifyListeners();
  }

  /// RAZORPAY PAYMENT METHOD

  getVenueData(VenueDataModel venueData) {
    _venuData = venueData;
    notifyListeners();
  }


  openPayment({required RazorPayModel razorPayModel}) {
    final options = {
      'key': 'rzp_test_byX4xjQdkJOyzX',
      'amount': razorPayModel.order?.amount,
      'name': 'Sportner App',
      'order_id': razorPayModel.order?.id,
      'description': 'Turf booking',
      'timeout': 60,
      'prefill': {
        'contact': '9123456789',
        'email': 'sportner@turf.com',
      }
    };
    try {
      _razorpay.open(options);
      if (!_razorPayPaymentInitialized) {
        razorPayPayment();
        _razorPayPaymentInitialized = true;
      }
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
    final slotDate = DateFormat('d,MMM,y').format(
      DateTime.parse('${_bookingData!.selectedDate}'),
    );
    final body = ProceedPaymentModel(
      razorpayOrderId: orderId,
      razorpayPaymentId: paymentId,
      razorpaySignature: signature,
      turfId: _venuData!.sId,
      facility: _bookingData!.selectedRadioButton,
      slotDate: slotDate,
      price: razorPayOrderModel!.order!.amount.toString(),
      slotTime: _bookingData!.selectedTime,
      sport: _bookingData!.selectedSportName,
    );
    log(body.toJson().toString());
    return body.toJson();
  }

  getProceedPayment() async {
    final accessToken = await AccessToken.getAccessToken();
    final response = await ApiServices.postMethod(
        url: Urls.kGETPROCEEDPAYMENT,
        body: proceedPaymentBody(),
        headers: {"Authorization": accessToken!});
    if (response is Success) {
      NavigatorClass.navigatorKey.currentState?.pushNamedAndRemoveUntil(
          NavigatorClass.paymentSuccessView, (route) => false);

      log("Success --------------- --------");
    }
    if (response is Failure) {
      log("Error");
    }
  }

  /// GER ORDER RESPONSE TO PAY THROUGH THE RAZORPAY

  Map<String, dynamic> paymentModelBody(String venueId) {
    final slotData = DateFormat('d,MMM,y').format(
      DateTime.parse('${_bookingData!.selectedDate}'),
    );
    final body = PaymentModel(
      turf: venueId,
      method: _isWallet == true ? "wallet" : "online",
      sport: _bookingData!.selectedSportName,
      slotTime: _bookingData!.selectedTime,
      facility: _bookingData!.selectedRadioButton,
      slotDate: slotData,
    );
    log(body.toJson().toString());
    return body.toJson();
  }

  getOrderModel({
    required String venueId,
  }) async {
    razorPayOrderModel = null;
    final accessToken = await AccessToken.getAccessToken();
    final response = await ApiServices.postMethod(
        url: Urls.kGETORDERID,
        body: paymentModelBody(venueId),
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
    razorPayOrderModel ??= orderModel;

    if (razorPayOrderModel != null) {
      openPayment(razorPayModel: razorPayOrderModel!);
    }
    notifyListeners();
  }
}
