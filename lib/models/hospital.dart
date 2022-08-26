import 'package:google_maps_flutter/google_maps_flutter.dart';

class HospitalModel {
  int? id;
  int? type;
  int? state;
  int? totalBeds;
  int? currBeds;
  int? ipd;
  int? opd;
  String? name;
  String? phone;
  String? address;
  int? public;
  String? openHours;
  LatLng? latLng;
  List<String>? photos;
  List<SpecializationModel>? specs;
  List<FacilitiesModel>? facilities;

  HospitalModel({
    this.id,
    this.type,
    this.state,
    this.totalBeds,
    this.ipd,
    this.phone,
    this.opd,
    this.currBeds,
    this.name,
    this.address,
    this.public,
    this.openHours,
    this.latLng,
    this.photos,
    this.specs,
    this.facilities,
  });
}

class SpecializationModel {
  String? name;
  String? desc;
  String? doctor;
  String? phone;
  String? email;

  SpecializationModel({
    this.name,
    this.desc,
    this.doctor,
    this.email,
    this.phone,
  });
}

class FacilitiesModel {
  String? name;
  String? desc;
  String? photo;

  FacilitiesModel({
    this.name,
    this.desc,
    this.photo,
  });
}
