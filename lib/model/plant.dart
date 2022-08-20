import 'package:la_vie/model/product.dart';

class PlantsResponse {
  String? type;
  String? message;
  List<Plant>? data;

  PlantsResponse({this.type, this.message, this.data});

  PlantsResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Plant>[];
      json['data'].forEach((v) {
        data!.add(Plant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Plant {
  String? id;
  String? name;
  String? description;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  Plant(
      {this.id,
      this.name,
      this.description,
      this.waterCapacity,
      this.sunLight,
      this.temperature});

  Plant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['waterCapacity'] = this.waterCapacity;
    data['sunLight'] = this.sunLight;
    data['temperature'] = this.temperature;
    return data;
  }
}
