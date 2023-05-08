// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'dart:convert';

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
    String? turf;
    String? method;
    String? slotTime;
    String? sport;
    String? facility;
    String? slotDate;

    PaymentModel({
        this.turf,
        this.method,
        this.slotTime,
        this.sport,
        this.facility,
        this.slotDate,
    });

    factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        turf: json["turf"],
        method: json["method"],
        slotTime: json["slotTime"],
        sport: json["sport"],
        facility: json["facility"],
        slotDate: json["slotDate"],
    );

    Map<String, dynamic> toJson() => {
        "turf": turf,
        "method": method,
        "slotTime": slotTime,
        "sport": sport,
        "facility": facility,
        "slotDate": slotDate,
    };
}
