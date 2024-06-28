import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:thread_clone/models/unsplash_model.dart';

Future<List<UnsplashModel>> parseUnsplash() async {
  List<UnsplashModel> result = [];
  final String response = await rootBundle.loadString("assets/unsplash.json");
  final List<Map<String, dynamic>> jsonList = jsonDecode(response);
  for (var model in jsonList) {
    result.add(UnsplashModel(id: model["id"], urls: model["urls"]));
  }
  return result;
}
