// To parse this JSON data, do
//
//     final venueBySportModel = venueBySportModelFromJson(jsonString);

import 'dart:convert';

List<VenueBySportModel> venueBySportModelFromJson(String str) => List<VenueBySportModel>.from(json.decode(str).map((x) => VenueBySportModel.fromJson(x)));

String venueBySportModelToJson(List<VenueBySportModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VenueBySportModel {
  String? sId;
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
  List<Slots>? slots;
  List<SportFacility>? sportFacility;
  double? lat;
  double? lng;
  bool? isBlocked;
  bool? vmIsBlocked;
  bool? approved;
  String? createdAt;
  String? updatedAt;
  int? iV;

  VenueBySportModel(
      {this.sId,
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
      this.iV});

  VenueBySportModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    vmId = json['vmId'];
    venueName = json['venueName'];
    mobile = json['mobile'];
    district = json['district'];
    place = json['place'];
    actualPrice = json['actualPrice'];
    discountPercentage = json['discountPercentage'];
    description = json['description'];
    image = json['image'];
    document = json['document'];
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add( Slots.fromJson(v));
      });
    }
    if (json['sportFacility'] != null) {
      sportFacility = <SportFacility>[];
      json['sportFacility'].forEach((v) {
        sportFacility!.add( SportFacility.fromJson(v));
      });
    }
    lat = json['lat'];
    lng = json['lng'];
    isBlocked = json['isBlocked'];
    vmIsBlocked = json['vmIsBlocked'];
    approved = json['approved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['vmId'] = vmId;
    data['venueName'] = venueName;
    data['mobile'] = mobile;
    data['district'] = district;
    data['place'] = place;
    data['actualPrice'] = actualPrice;
    data['discountPercentage'] = discountPercentage;
    data['description'] = description;
    data['image'] = image;
    data['document'] = document;
    if (slots != null) {
      data['slots'] = slots!.map((v) => v.toJson()).toList();
    }
    if (sportFacility != null) {
      data['sportFacility'] =
          sportFacility!.map((v) => v.toJson()).toList();
    }
    data['lat'] = lat;
    data['lng'] = lng;
    data['isBlocked'] = isBlocked;
    data['vmIsBlocked'] = vmIsBlocked;
    data['approved'] = approved;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Slots {
  String? day;
  List<String>? slots;

  Slots({this.day, this.slots});

  Slots.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    slots = json['slots'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['day'] = day;
    data['slots'] = slots;
    return data;
  }
}

class SportFacility {
  String? sportId;
  String? sport;
  String? facility;
  String? sId;

  SportFacility({this.sportId, this.sport, this.facility, this.sId});

  SportFacility.fromJson(Map<String, dynamic> json) {
    sportId = json['sportId'];
    sport = json['sport'];
    facility = json['facility'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sportId'] =sportId;
    data['sport'] =sport;
    data['facility'] =facility;
    data['_id'] =sId;
    return data;
  }
}