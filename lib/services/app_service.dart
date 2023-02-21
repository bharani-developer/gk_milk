import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:gk_milk/models/app_model.dart';


Future<String> loadContentAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<Appconfig> loadConfig() async {
  String jsonString =
      await loadContentAsset('assets/data/app_config.json');
  final jsonResponse = json.decode(jsonString);
  return Appconfig.fromJson(jsonResponse);
}