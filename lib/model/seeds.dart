import 'package:la_vie/model/blogs.dart';
import 'package:la_vie/model/product.dart';

class SeedsResponse {
  String? type;
  String? message;
  List<Seeds>? data;

  SeedsResponse({this.type, this.message, this.data});

  SeedsResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Seeds>[];
      json['data'].forEach((v) {
        data!.add(new Seeds.fromJson(v));
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

class Seeds {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  Seeds({this.seedId, this.name, this.description, this.imageUrl});

  Seeds.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seedId'] = this.seedId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
