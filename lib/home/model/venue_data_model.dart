

import 'dart:convert';

VenueDataModel venueDataModelFromJson(String str) => VenueDataModel.fromJson(json.decode(str));


class VenueDataModel {
    VenueDataModel({
        this.id,
        this.vmId,
        this.venueName,
        this.mobile,
        this.district,
        this.place,
        this.actualPrice,
        this.discountPercentage,
        this.description,
        this.image,
        this.document,
        this.slots,
        this.sportFacility,
        this.lat,
        this.lng,
        this.isBlocked,
        this.vmIsBlocked,
        this.approved,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? vmId;
    String? venueName;
    int? mobile;
    String? district;
    String? place;
    int? actualPrice;
    int? discountPercentage;
    String? description;
    String? image;
    String? document;
    List<Slot>? slots;
    List<SportFacility>? sportFacility;
    double? lat;
    double? lng;
    bool? isBlocked;
    bool? vmIsBlocked;
    bool? approved;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory VenueDataModel.fromJson(Map<String, dynamic> json) => VenueDataModel(
        id: json["_id"],
        vmId: json["vmId"],
        venueName: json["venueName"],
        mobile: json["mobile"],
        district: json["district"],
        place: json["place"],
        actualPrice: json["actualPrice"],
        discountPercentage: json["discountPercentage"],
        description: json["description"],
        image: json["image"],
        document: json["document"],
        slots: json["slots"] == null ? [] : List<Slot>.from(json["slots"]!.map((x) => Slot.fromJson(x))),
        sportFacility: json["sportFacility"] == null ? [] : List<SportFacility>.from(json["sportFacility"]!.map((x) => SportFacility.fromJson(x))),
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        isBlocked: json["isBlocked"],
        vmIsBlocked: json["vmIsBlocked"],
        approved: json["approved"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        v: json["__v"],
    );

}

class Slot {
    Slot({
        this.day,
        this.slots,
    });

    String? day;
    List<String>? slots;

    factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        day: json["day"],
        slots: json["slots"] == null ? [] : List<String>.from(json["slots"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "slots": slots == null ? [] : List<dynamic>.from(slots!.map((x) => x)),
    };
}

class SportFacility {
    SportFacility({
        this.sportId,
        this.sport,
        this.facility,
        this.id,
    });

    String? sportId;
    String? sport;
    String? facility;
    String? id;

    factory SportFacility.fromJson(Map<String, dynamic> json) => SportFacility(
        sportId: json["sportId"],
        sport: json["sport"],
        facility: json["facility"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "sportId": sportId,
        "sport": sport,
        "facility": facility,
        "_id": id,
    };
}
