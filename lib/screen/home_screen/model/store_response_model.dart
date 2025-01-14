// To parse this JSON data, do
//
//     final storeDetailResponseModel = storeDetailResponseModelFromJson(jsonString);

import 'dart:convert';

StoreDetailResponseModel storeDetailResponseModelFromJson(String str) => StoreDetailResponseModel.fromJson(json.decode(str));

String storeDetailResponseModelToJson(StoreDetailResponseModel data) => json.encode(data.toJson());

class StoreDetailResponseModel {
  String msg;
  List<StoreDetailModel> data;

  StoreDetailResponseModel({
    required this.msg,
    required this.data,
  });

  factory StoreDetailResponseModel.fromJson(Map<String, dynamic> json) => StoreDetailResponseModel(
    msg: json["msg"],
    data: List<StoreDetailModel>.from(json["data"].map((x) => StoreDetailModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class StoreDetailModel {
  String code;
  String storeLocation;
  double latitude;
  double longitude;
  String storeAddress;
  String timezone;
  double distance;
  int isNearestStore;
  String dayOfWeek;
  String startTime;
  String endTime;

  StoreDetailModel({
    required this.code,
    required this.storeLocation,
    required this.latitude,
    required this.longitude,
    required this.storeAddress,
    required this.timezone,
    required this.distance,
    required this.isNearestStore,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  factory StoreDetailModel.fromJson(Map<String, dynamic> json) => StoreDetailModel(
    code: json["code"],
    storeLocation: json["storeLocation"],
    latitude: double.parse(json["latitude"]),
    longitude: double.parse(json["longitude"]),
    storeAddress: json["storeAddress"],
    timezone: json["timezone"],
    distance: json["distance"]?.toDouble(),
    isNearestStore: json["isNearestStore"],
    dayOfWeek: json["dayOfWeek"],
    startTime: json["start_time"],
    endTime: json["end_time"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "storeLocation": storeLocation,
    "latitude": latitude,
    "longitude": longitude,
    "storeAddress": storeAddress,
    "timezone": timezone,
    "distance": distance,
    "isNearestStore": isNearestStore,
    "dayOfWeek": dayOfWeek,
    "start_time": startTime,
    "end_time": endTime,
  };
}
