class FiltersResponse {
  String? type;
  String? message;
  Data? data;

  FiltersResponse({this.type, this.message, this.data});

  FiltersResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  List<String>? plants;
  List<String>? tools;
  List<String>? seeds;

  Data({this.plants, this.tools, this.seeds});

  Data.fromJson(Map<String, dynamic> json) {
    plants = json['plants'].cast<String>();
    tools = json['tools'].cast<String>();
    seeds = json['seeds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plants'] = this.plants;
    data['tools'] = this.tools;
    data['seeds'] = this.seeds;
    return data;
  }
}
