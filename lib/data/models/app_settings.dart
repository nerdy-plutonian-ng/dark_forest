// To parse this JSON data, do
//
//     final appSettings = appSettingsFromJson(jsonString);

import 'dart:convert';

class AppSettingsModel {
  AppSettingsModel({
    required this.id,
    required this.isDarkModeOn,
  });

  final String id;
  final bool isDarkModeOn;

  factory AppSettingsModel.fromJson(Map<String, Object?> json) =>
      AppSettingsModel(
        id: json["_id"] as String,
        isDarkModeOn: json["isDarkModeOn"] as int == 1,
      );

  Map<String, Object?> toJson() => {
        "_id": id,
        "isDarkModeOn": isDarkModeOn ? 1 : 0,
      };

  static AppSettingsModel? appSettingsFromJson(String str) =>
      AppSettingsModel.fromJson(json.decode(str));

  static String appSettingsToJson(AppSettingsModel? data) =>
      json.encode(data!.toJson());
}
