import 'dart:convert';

ProceedPaymentModel proceedPaymentModelFromJson(String str) => ProceedPaymentModel.fromJson(json.decode(str));

String proceedPaymentModelToJson(ProceedPaymentModel data) => json.encode(data.toJson());

class ProceedPaymentModel {
    String? razorpayPaymentId;
    String? razorpayOrderId;
    String? razorpaySignature;
    String? turfId;
    String? sport;
    String? facility;
    String? slotDate;
    String? slotTime;
    String? price;

    ProceedPaymentModel({
        this.razorpayPaymentId,
        this.razorpayOrderId,
        this.razorpaySignature,
        this.turfId,
        this.sport,
        this.facility,
        this.slotDate,
        this.slotTime,
        this.price,
    });

    factory ProceedPaymentModel.fromJson(Map<String, dynamic> json) => ProceedPaymentModel(
        razorpayPaymentId: json["razorpay_payment_id"],
        razorpayOrderId: json["razorpay_order_id"],
        razorpaySignature: json["razorpay_signature"],
        turfId: json["turfId"],
        sport: json["sport"],
        facility: json["facility"],
        slotDate: json["slotDate"],
        slotTime: json["slotTime"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "razorpay_payment_id": razorpayPaymentId,
        "razorpay_order_id": razorpayOrderId,
        "razorpay_signature": razorpaySignature,
        "turfId": turfId,
        "sport": sport,
        "facility": facility,
        "slotDate": slotDate,
        "slotTime": slotTime,
        "price": price,
    };
}
