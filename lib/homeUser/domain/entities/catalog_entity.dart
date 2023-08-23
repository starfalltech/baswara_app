// To parse this JSON data, do
//
//     final catalogEntity = catalogEntityFromJson(jsonString);

import 'dart:convert';

CatalogEntity catalogEntityFromJson(String str) =>
    CatalogEntity.fromJson(json.decode(str));

String catalogEntityToJson(CatalogEntity data) => json.encode(data.toJson());

class CatalogEntity {
  int code;
  String status;
  String message;
  List<CatalogData> data;

  CatalogEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory CatalogEntity.fromJson(Map<String, dynamic> json) => CatalogEntity(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: List<CatalogData>.from(
            json["data"].map((x) => CatalogData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CatalogData {
  int id;
  String name;
  String url;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;

  CatalogData({
    required this.id,
    required this.name,
    required this.url,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CatalogData.fromJson(Map<String, dynamic> json) => CatalogData(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        imageUrl: json["image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "image_url": imageUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
