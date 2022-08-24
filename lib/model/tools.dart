
import 'package:la_vie/model/product.dart';

class ToolsResponse {
  String? type;
  String? message;
  List<Tools>? data;

  ToolsResponse({this.type, this.message, this.data});

  ToolsResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Tools>[];
      json['data'].forEach((v) {
        data!.add(new Tools.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tools {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;

  Tools({this.toolId, this.name, this.description, this.imageUrl});
  

  Tools.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['toolId'] = this.toolId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}