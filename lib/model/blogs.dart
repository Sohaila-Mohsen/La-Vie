import 'plant.dart';
import 'seeds.dart';
import 'tools.dart';

class BlogResponse {
  String? type;
  String? message;
  Seeds? data;

  BlogResponse({this.type, this.message, this.data});

  BlogResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new Seeds.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Seeds {
  List<Plant>? plants;
  List<Seeds>? seeds;
  List<Tools>? tools;

  Seeds({this.plants, this.seeds, this.tools});

  Seeds.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      plants = <Plant>[];
      json['plants'].forEach((v) {
        plants!.add(new Plant.fromJson(v));
      });
    }
    if (json['seeds'] != null) {
      seeds = <Seeds>[];
      json['seeds'].forEach((v) {
        seeds!.add(new Seeds.fromJson(v));
      });
    }
    if (json['tools'] != null) {
      tools = <Tools>[];
      json['tools'].forEach((v) {
        tools!.add(new Tools.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plants != null) {
      data['plants'] = this.plants!.map((v) => v.toJson()).toList();
    }
    if (this.seeds != null) {
      data['seeds'] = this.seeds!.map((v) => v.toJson()).toList();
    }
    if (this.tools != null) {
      data['tools'] = this.tools!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
