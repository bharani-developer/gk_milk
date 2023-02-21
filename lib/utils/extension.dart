import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:gk_milk/models/address_model.dart';
import 'package:gk_milk/models/attribute_model.dart';
import 'package:gk_milk/models/category_model.dart';
import 'package:gk_milk/models/order_model.dart';
import 'package:gk_milk/models/product_model.dart';

Future<String> loadContentAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<List<ShCategory>> loadCategory() async {
  String jsonString =
      await loadContentAsset('assets/data/category.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShCategory.fromJson(i)).toList();
}

Future<List<ShProduct>> loadProducts() async {
  String jsonString =
      await loadContentAsset('assets/data/products.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShProduct.fromJson(i)).toList();
}

Future<List<ShProduct>> loadCartProducts() async {
  String jsonString =
      await loadContentAsset('assets/data/cart_products.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShProduct.fromJson(i)).toList();
}

Future<ShAttributes> loadAttributes() async {
  String jsonString =
      await loadContentAsset('assets/data/attributes.json');
  final jsonResponse = json.decode(jsonString);
  return ShAttributes.fromJson(jsonResponse);
}

Future<List<ShAddressModel>> loadAddresses() async {
  String jsonString =
      await loadContentAsset('assets/data/address.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShAddressModel.fromJson(i)).toList();
}

// Future<List<Order>> loadOrders() async {
//   String jsonString = await loadContentAsset('assets/data/orders.json');
//   final jsonResponse = json.decode(jsonString);
//   return (jsonResponse as List).map((i) => Order.fromJson(i)).toList();
// }

Future<List<Order>> loadOrders() async {
  String jsonString = await loadContentAsset('assets/data/orders.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => Order.fromJson(i)).toList();
}

Future<List<String>> loadBanners() async {
  List<ShProduct> products = await loadProducts();
  List<String> banner = [];

  for (var product in products) {
    if (product.images!.isNotEmpty) {
      banner.add(product.images![0].src!);
    }
  }
  return banner;
}

extension StringExtension on String? {
  String? toCurrencyFormat({var format = '₹'}) {
    return format + this;
  }

  String formatDateTime() {
    if (this == null || this!.isEmpty || this == "null") {
      return "NA";
    } else {
      return DateFormat("HH:mm dd MMM yyyy", "en_US")
          .format(DateFormat("yyyy-MM-dd HH:mm:ss.0", "en_US").parse(this!));
    }
  }

  String formatDate() {
    if (this == null || this!.isEmpty || this == "null") {
      return "NA";
    } else {
      return DateFormat("dd MMM yyyy", "en_US")
          .format(DateFormat("yyyy-MM-dd", "en_US").parse(this!));
    }
  }
}
