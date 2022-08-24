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

class PlantResponse {
  String? type;
  String? message;
  Plant? data;

  PlantResponse({this.type, this.message, this.data});

  PlantResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['message'] = message;
    data['data'] = data;

    return data;
  }
}

class Plant {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;
  int quantity = 1;

  Plant(
      {this.id,
      this.quantity = 1,
      this.name,
      this.description,
      this.imageUrl,
      this.waterCapacity,
      this.sunLight,
      this.temperature});
  
  

  Plant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['waterCapacity'] = waterCapacity;
    data['sunLight'] = sunLight;
    data['temperature'] = temperature;
    return data;
  }
}
