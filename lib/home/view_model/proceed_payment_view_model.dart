import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sporter_turf_booking/data/response/api_response.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';
import 'package:sporter_turf_booking/repository/proceed_payment_repository.dart';
import '../../utils/constants.dart';
import '../../utils/routes/navigations.dart';
import '../model/payment_model.dart';
import '../model/proceed_payment_model.dart';
import '../model/razor_pay_model.dart';
import '../model/venue_data_model.dart';

class ProceedPaymentViewModel with ChangeNotifier {
  final _myRepo = ProceedPaymentRepository();
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
    _myRepo
        .getProceedPayment(
          url: Urls.kGETPROCEEDPAYMENT,
          body: proceedPaymentBody(),
        )
        .then(
          (value) => {
            NavigatorClass.navigatorKey.currentState?.pushNamedAndRemoveUntil(
                NavigatorClass.paymentSuccessView, (route) => false)
          },
        )
        .onError(
          (error, stackTrace) => {},
        );
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
    _myRepo
        .getOrderModel(
          url: Urls.kGETORDERID,
          body: paymentModelBody(venueId),
        )
        .then(
          (value) => {
            setOrderModelResponse(
                ApiResponse.completed(value).data as RazorPayModel),
          },
        )
        .onError(
          (error, stackTrace) => {
            ApiResponse.error(
              error.toString(),
            ),
          },
        );
  }

  setOrderModelResponse(RazorPayModel orderModel) async {
    razorPayOrderModel ??= orderModel;

    if (razorPayOrderModel != null) {
      openPayment(razorPayModel: razorPayOrderModel!);
    }
    notifyListeners();
  }
}
