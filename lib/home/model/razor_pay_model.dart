// To parse this JSON data, do
//
//     final razorPayModel = razorPayModelFromJson(jsonString);

import 'dart:convert';

RazorPayModel razorPayModelFromJson(String str) => RazorPayModel.fromJson(json.decode(str));

String razorPayModelToJson(RazorPayModel data) => json.encode(data.toJson());

class RazorPayModel {
    Order? order;

    RazorPayModel({
        this.order,
    });

    factory RazorPayModel.fromJson(Map<String, dynamic> json) => RazorPayModel(
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
    );

    Map<String, dynamic> toJson() => {
        "order": order?.toJson(),
    };
}

class Order {
    String? id;
    String? entity;
    int? amount;
    int? amountPaid;
    int? amountDue;
    String? currency;
    String? receipt;
    dynamic offerId;
    String? status;
    int? attempts;
    List<dynamic>? notes;
    int? createdAt;

    Order({
        this.id,
        this.entity,
        this.amount,
        this.amountPaid,
        this.amountDue,
        this.currency,
        this.receipt,
        this.offerId,
        this.status,
        this.attempts,
        this.notes,
        this.createdAt,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        entity: json["entity"],
        amount: json["amount"],
        amountPaid: json["amount_paid"],
        amountDue: json["amount_due"],
        currency: json["currency"],
        receipt: json["receipt"],
        offerId: json["offer_id"],
        status: json["status"],
        attempts: json["attempts"],
        notes: json["notes"] == null ? [] : List<dynamic>.from(json["notes"]!.map((x) => x)),
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "entity": entity,
        "amount": amount,
        "amount_paid": amountPaid,
        "amount_due": amountDue,
        "currency": currency,
        "receipt": receipt,
        "offer_id": offerId,
        "status": status,
        "attempts": attempts,
        "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x)),
        "created_at": createdAt,
    };
}
