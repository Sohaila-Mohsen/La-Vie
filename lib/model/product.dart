import 'package:la_vie/model/plant.dart';
import 'package:la_vie/model/seeds.dart';
import 'package:la_vie/model/tools.dart';

class ProductsResponse {
  String? type;
  String? message;
  List<Product>? data;

  ProductsResponse({this.type, this.message, this.data});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
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

class Product {
  String? productId;
  String? name;
  String? description;
  String? imageUrl;
  String? type;
  int? price;
  bool? available;
  Seed? seed;
  Plant? plant;
  Tool? tool;

  Product(
      {this.productId,
      this.name,
      this.description,
      this.imageUrl,
      this.type,
      this.price,
      this.available,
      this.seed,
      this.plant,
      this.tool});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    seed = json['seed'] != null ? new Seed.fromJson(json['seed']) : null;
    plant = json['plant'] != null ? new Plant.fromJson(json['plant']) : null;
    tool = json['tool'] != null ? new Tool.fromJson(json['tool']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> product = new Map<String, dynamic>();
    product['productId'] = this.productId;
    product['name'] = this.name;
    product['description'] = this.description;
    product['imageUrl'] = this.imageUrl;
    product['type'] = this.type;
    product['price'] = this.price;
    product['available'] = this.available;
    if (this.seed != null) {
      product['seed'] = this.seed!.toJson();
    }
    if (this.plant != null) {
      product['plant'] = this.plant!.toJson();
    }
    if (this.tool != null) {
      product['tool'] = this.tool!.toJson();
    }
    return product;
  }
}
