import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thread_clone/models/unsplash_model.dart';

class UnsplashHttp {
  static const String baseUrl = "http://localhost:3000/images";

  static Future<UnsplashModel> getImage(int index) async {
    final url = Uri.parse("$baseUrl/$index");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final unsplash = jsonDecode(response.body);
      return UnsplashModel(id: unsplash["id"]!, urls: unsplash["urls"]["small"]);
    }
    throw Error();
  }
}
