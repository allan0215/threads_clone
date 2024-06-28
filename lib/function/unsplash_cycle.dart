import 'package:thread_clone/models/unsplash_model.dart';
import 'package:thread_clone/services/unsplash_http.dart';
import 'package:thread_clone/services/unsplash_parse.dart';

class UnsplashCycle {
  int _countIndex = 0;

  UnsplashCycle();

  void _countValidator() {
    if (_countIndex >= 30) {
      _countIndex = 0;
    }
  }

  String getModel() {
    final result = "http://localhost:3000/images/${_countIndex++}";
    _countValidator();
    return result;
  }
}
