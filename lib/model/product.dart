import 'package:la_vie/bloc/app_products/app_products_cubit.dart';
import 'package:la_vie/model/plant.dart';
import 'package:la_vie/model/seeds.dart';
import 'package:la_vie/model/tools.dart';

class ProductsResponse {
  String? type;
  String? message;
  List<Product>? data;
  Product? singleProduct;

  ProductsResponse({this.type, this.message, this.data});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(Product.fromJson(v));
      });
    }
  }
  ProductsResponse.fromJsonSingle(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    print("3333333333333333333333");
    singleProduct =
        json['data'] != null ? Product.fromJson(json['data']) : null;
    print("53333333333333555555555555333333333");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? productId;
  String? name;
  int quantity = 1;
  String? description;
  String? imageUrl;
  String? type;
  int? price;
  bool? available;
  Seeds? seed;
  Plant? plant;
  Tools? tool;

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
    seed = json['seed'] != null ? Seeds.fromJson(json['seed']) : null;
    plant = json['plant'] != null ? Plant.fromJson(json['plant']) : null;
    tool = json['tool'] != null ? Tools.fromJson(json['tool']) : null;
  }
  static Future<List<Product>> sqlToProducts(
      List<Map<String, dynamic>> products) async {
    List<Product> cartProducts = [];
    for (var product in products) {
      print("peooo 000000 : $product");
      String productId = product['productId'];
      print("id : $productId");
      AppProductsCubit appProductsCubit = AppProductsCubit();
      await appProductsCubit.getSingleProduct(productId).then((value) {
        print("Tttttttttttttttttttttt/${appProductsCubit.p!.name}");
        cartProducts.add(appProductsCubit.p!);
      });
      print("item added to cart successfully ${cartProducts.length}");
    }
    print("cartProducts ${cartProducts.length}");
    for (var c in cartProducts) {
      print("c : ${c.type}");
    }
    return cartProducts;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> product = Map<String, dynamic>();
    product['productId'] = productId;
    product['name'] = name;
    product['description'] = description;
    product['imageUrl'] = imageUrl;
    product['type'] = type;
    product['price'] = price;
    product['available'] = available;
    if (seed != null) {
      product['seed'] = seed!.toJson();
    }
    if (plant != null) {
      product['plant'] = plant!.toJson();
    }
    if (tool != null) {
      product['tool'] = tool!.toJson();
    }
    return product;
  }

  static List<Product>? toolToProduct(List<Tools> tools) {
    List<Product> products = [];
    for (var tool in tools) {
      products.add(Product(
          imageUrl: tool.imageUrl,
          type: "TOOL",
          price: 200,
          productId: tool.toolId,
          name: tool.name,
          description: tool.description));
    }
    return products;
  }

  static List<Product>? plantToProduct(List<Plant> plants) {
    List<Product> products = [];
    for (var plant in plants) {
      products.add(Product(
          imageUrl: plant.imageUrl,
          type: "PLANT",
          price: 200,
          productId: plant.id,
          name: plant.name,
          description: plant.description));
    }
    return products;
  }

  static List<Product>? seedToProduct(List<Seeds> seeds) {
    List<Product> products = [];
    for (var seed in seeds) {
      products.add(Product(
          imageUrl: seed.imageUrl,
          type: "SEED",
          price: 200,
          productId: seed.seedId,
          name: seed.name,
          description: seed.description));
    }
    return products;
  }
}
