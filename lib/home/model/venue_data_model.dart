

import 'dart:convert';

List<VenueDataModel> venueDataModelListFromJson(String str) =>
    List<VenueDataModel>.from(
        json.decode(str).map((x) => VenueDataModel.fromJson(x)));



class VenueDataModel {
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

  VenueDataModel(
      {sId,
      vmId,
      venueName,
      mobile,
      district,
      place,
      actualPrice,
      discountPercentage,
      description,
      image,
      document,
      slots,
      sportFacility,
      lat,
      lng,
      isBlocked,
      vmIsBlocked,
      approved,
      createdAt,
      updatedAt,
      iV});

  VenueDataModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data =  {};
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

  Slots({day, slots});

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

  SportFacility({sportId, sport, facility, sId});

  SportFacility.fromJson(Map<String, dynamic> json) {
    sportId = json['sportId'];
    sport = json['sport'];
    facility = json['facility'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sportId'] = sportId;
    data['sport'] = sport;
    data['facility'] = facility;
    data['_id'] = sId;
    return data;
  }
}